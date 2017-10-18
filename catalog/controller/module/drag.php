<?php
class ControllerModuledrag extends Controller {
	public function index() {
		$this->load->language('module/drag');

		$data['heading_title'] = $this->language->get('heading_title');
                
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_drag'] = $this->language->get('text_drag');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');

		$data['logged'] = $this->customer->isLogged();
		$data['register'] = $this->url->link('drag/register', '', 'SSL');
		$data['login'] = $this->url->link('drag/login', '', 'SSL');
		$data['logout'] = $this->url->link('drag/logout', '', 'SSL');
		$data['forgotten'] = $this->url->link('drag/forgotten', '', 'SSL');
		$data['drag'] = $this->url->link('drag/drag', '', 'SSL');
		$data['edit'] = $this->url->link('drag/edit', '', 'SSL');
		$data['password'] = $this->url->link('drag/password', '', 'SSL');
		$data['address'] = $this->url->link('drag/address', '', 'SSL');
		$data['wishlist'] = $this->url->link('drag/wishlist');
		$data['order'] = $this->url->link('drag/order', '', 'SSL');
		$data['download'] = $this->url->link('drag/download', '', 'SSL');
		$data['reward'] = $this->url->link('drag/reward', '', 'SSL');
		$data['return'] = $this->url->link('drag/return', '', 'SSL');
		$data['transaction'] = $this->url->link('drag/transaction', '', 'SSL');
		$data['newsletter'] = $this->url->link('drag/newsletter', '', 'SSL');
		$data['recurring'] = $this->url->link('drag/recurring', '', 'SSL');
                
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/drag.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/drag.tpl', $data);
		} else {
			return $this->load->view('default/template/module/drag.tpl', $data);
		}
	}
}