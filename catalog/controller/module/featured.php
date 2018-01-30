<?php

class ControllerModuleFeatured extends Controller {

    public function index($setting) {

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $this->load->language('module/featured');
        $data['cart_icon'] = $server . "image/catalog/cart2.png";
        $data['search_icon'] = $server . "image/catalog/search.png";
        $data['heading_title'] = $this->language->get('heading_title');
        $data['no_product_background_icon'] = $server . "image/catalog/lol.png";
            $data['product_background_icon'] = $server . "image/catalog/lol2.png";

        $data['text_tax'] = $this->language->get('text_tax');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['products'] = array();
        $data['product_images'] = array();

        if (!$setting['limit']) {
            $setting['limit'] = 4;
        }

        if (!empty($setting['product'])) {
            $products = array_slice($setting['product'], 0, (int) $setting['limit']);

            foreach ($products as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);
                if ($product_info['quantity'] <= 0) {
                    $data['mojoodi'] = "در انبار";
                    $data['stock'] = $product_info['stock_status'];
                } elseif ($this->config->get('config_stock_display')) {
                    $data['mojoodi'] = "موجود است";
                    $data['stock'] = $product_info['quantity'];
                } else {
                    $data['mojoodi'] = "در انبار";
                    $data['stock'] = $this->language->get('text_instock');
                }
                $product_images = array();
                $product_images = $this->model_catalog_product->getProductImages($product_id);
                for ($i = 0; $i < count($product_images); $i++) {
                    $product_images[$i]['image'] = $server . 'image/' . $product_images[$i]['image'];
                }
                if ($product_info) {
                    if ($product_info['image']) {
                        $image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                    }

                    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $price = false;
                    }

                    if ((float) $product_info['special']) {
                        $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float) $product_info['special'] ? $product_info['special'] : $product_info['price']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = $product_info['rating'];
                    } else {
                        $rating = false;
                    }
                   $myoption = $this->model_catalog_product->getProductOptions($product_info['product_id']);
                    $data['products'][] = array(
                        'product_id' => $product_info['product_id'],
                        'thumb' => $image,
                        'name' => $product_info['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                        'price' => $price,
                        'special' => $special,
                        'tax' => $tax,
                        'rating' => $rating,
                        'href' => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
                        'images' => $product_images,
                        'mojoodi' => $data['mojoodi'],
                        'model' => $product_info['model'],
                        'options' => $myoption
                    );
                }
            }
        }

        if ($data['products']) {
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
            } else {
                return $this->load->view('default/template/module/featured.tpl', $data);
            }
        }
    }

}
