<?php

class ControllerPaymentBankTransfer extends Controller
{
    public function index()
    {
        $this->load->language('payment/bank_transfer');

        $data['text_instruction'] = $this->language->get('text_instruction');
        $data['text_description'] = $this->language->get('text_description');
        $data['text_payment'] = $this->language->get('text_payment');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['button_confirm'] = $this->language->get('button_confirm');

        $data['bank'] = nl2br($this->config->get('bank_transfer_bank' . $this->config->get('config_language_id')));

        $data['continue'] = "https://sep.shaparak.ir/payment.aspx";//$this->url->link('checkout/success');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/bank_transfer.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/payment/bank_transfer.tpl', $data);
        } else {
            return $this->load->view('default/template/payment/bank_transfer.tpl', $data);
        }
    }

    public function confirm()
    {
        if ($this->session->data['payment_method']['code'] == 'bank_transfer') {
            $this->load->language('payment/bank_transfer');


            $this->load->model('payment/saman');
            $this->load->model('checkout/order');
            $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
            $insertData['amount'] = (int)$order_info['total'];
            $insertData['resnum'] = md5(rand(0, 10000) + uniqid() + time());
            $insertData['order_id'] = $order_info['order_id'];
            $insertData['user_id'] = $order_info['customer_id'];
            $samanInsertId = $this->model_payment_saman->insert($insertData);
            if ($samanInsertId > 0) {
                $data['Amount'] = (int)$order_info['total'];
                $data['url'] = "https://sep.shaparak.ir/payment.aspx";
                $data['ResNum'] = $insertData['resnum'];
                $data['MID'] = 10373238;
                $data['RedirectURL'] = $this->url->link('payment/bank_transfer/check');
                $comment = $this->language->get('text_instruction') . "\n\n";
                $comment .= $this->config->get('bank_transfer_bank' . $this->config->get('config_language_id')) . "\n\n";
                //$comment .= $this->language->get('text_payment');

                // $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('bank_transfer_order_status_id'), $comment, true);
                $data['status'] = true;
                $this->response->setOutput(json_encode($data));

            } else {
                $data['status'] = false;
                $this->response->setOutput(json_encode($data));
            }


        }
    }

    public function check()
    {
        $this->load->model('payment/saman');
        $this->load->model('checkout/order');
        if (isset($_POST['State']) && isset($_POST['StateCode']) && isset($_POST['ResNum']) && isset($_POST['MID'])) {
            $amount = $this->Verify();
            $amount/=10;
            $set['state'] = $_POST['State'];
            $set['statecode'] = $_POST['StateCode'];
            $set['refnum'] = $_POST['RefNum'];
            $set['cid'] = $_POST['CID'];
            $set['traceno'] = $_POST['TRACENO'];
            $set['rrn'] = $_POST['RRN'];
            $set['securepan'] = $_POST['SecurePan'];
            $where['resnum'] = $_POST['ResNum'];
            $where['state'] = 'WENT_TO_BANK';
            $affectedRows = $this->model_payment_saman->update($set, $where);

            $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

            if ($affectedRows > 0 && $amount>0 && $amount == (int)$order_info['total']) {
                $comment="پرداخت با موفقیت انجام شد. مشخصات پرداخت:"."&#13;&#10;";
                $comment.="State=".$_POST['State']."&#13;&#10;";
                $comment.="StateCode=".$_POST['StateCode']."&#13;&#10;";
                $comment.="ResNum=".$_POST['ResNum']."&#13;&#10;";
                $comment.="RefNum=".$_POST['RefNum']."&#13;&#10;";
                $comment.="CID=".$_POST['CID']."&#13;&#10;";
                $comment.="RRN=".$_POST['RRN']."&#13;&#10;";
                $comment.="SecurePan=".$_POST['SecurePan']."&#13;&#10;";
                $comment.="Order_id=".$order_info['order_id']."&#13;&#10;";
                $this->model_checkout_order->addOrderHistory($this->session->data['order_id'],2, $comment, true);
                $this->response->redirect($this->url->link('checkout/success', '', 'SSL'));
            } else {
                $comment="پرداخت با شکست مواجه شد. مشخصات پرداخت:"."&#13;&#10;";
                $comment.="State=".$_POST['State']."&#13;&#10;";
                $comment.="StateCode=".$_POST['StateCode']."&#13;&#10;";
                $comment.="ResNum=".$_POST['ResNum']."&#13;&#10;";
                $comment.="Order_id=".$order_info['order_id']."&#13;&#10;";
                $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], 17 , $comment, true);
                $this->response->redirect($this->url->link('checkout/failure', '', 'SSL'));
            }

        } else {
            echo "ACCESS DENIED";
        }
    }

    private function Verify()
    {
        return 1000;

        if (isset($_POST['State']) && $_POST['State'] == "OK") {
            $soapclient = new soapclient('https://sep.shaparak.ir/Payments/ReferencePayment.asmx?WSDL');

            $res = $soapclient->VerifyTransaction($_POST['RefNum'], $_POST['MID']);#reference number and sellerid
            return $res;
        }
    }
}