<?php

class ControllerAccountAscript extends Controller
{
    public function index()
    {
        $this->load->model('catalog/product');
        $filter_data = array();
        $products = $this->model_catalog_product->getProducts($filter_data);

        foreach ($products as $product) {
            $productOptions = $this->model_catalog_product->getProductOptions($product['product_id']);
            foreach ($productOptions as $option) {
                $optionValues = $option['product_option_value'];
                foreach ($optionValues as $optionValue) {
                    $RES = $this->db->query("select * from dwc_filter_description WHERE  name like '%" .
                        $optionValue['name'] . "%'");
                    if ($RES->num_rows == 0) {
                        echo $optionValue['name'] . "      =======>     " . $product['product_id'] . "<br>";
                        continue;


                    } else {
                        $RES = $RES->rows[0]["filter_id"];
                        $res2 = $this->db->query("INSERT INTO dwc_product_filter(product_id,filter_id)
                      VALUES(" . $product['product_id'] . "," . $RES . ")");
                    }

                }

            }
        }
    }

}