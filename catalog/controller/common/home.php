<?php

class ControllerCommonHome extends Controller
{
    public function index()
    {

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $data['server'] = $server;
        $data['firstModalImgSrc'] = $server . "image/catalog/firstModal.jpg";
        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        if (isset($this->request->get['route'])) {
            $this->document->addLink(HTTP_SERVER, 'canonical');
        }
        $this->load->model("design/banner");
        $data['banner1'] = $this->model_design_banner->getBanner(7, 1)[0];

        $banner2 = $data['banner2'] = $this->model_design_banner->getBanner(6, 4);
        switch (count($banner2)) {
            case 0:
                $class = "hidden";
                break;
            case 1:
                $class = "col-xs-12";
                break;
            case 2:
                $class = "col-md-6";
                break;
            case 3:
                $class = "col-md-4";
                break;
            case 4:
                $class = "col-md-3";
                break;
            default:
                $class = " ";
        }
        $data['class'] = $class;

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
        }
    }
}