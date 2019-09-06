<?php
class ControllerCommonHeader extends Controller {
    public function  replaceWorkTime($data){

        return str_replace([' Пн – ',' Вс –'],[' <span>Пн –</span>','<span>Вс –</span>'], $data);
    }
	public function index() {

		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();

		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
		} else {

		  //  $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		    $data['text_wishlist'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);


		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['top_region'] = $this->language->get('top_region');
		$data['top_shops'] = $this->language->get('top_shops');
		$data['top_login_text'] = $this->language->get('top_login_text');
		$data['top_register_text'] = $this->language->get('top_register_text');
		$data['top_wish_text'] = $this->language->get('top_wish_text');
		$data['top_catalog'] = $this->language->get('top_catalog');

		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		if($this->session->data['language'] == 'en-gb'){
		    $redyLng= '2';
        }else {
            $redyLng= '1';
        }


		$data['work_time_redy'] =   $this->replaceWorkTime($this->config->get('config_langdata')[$redyLng]['open']);

        $sobfeedback = new sobfeedback($this->registry);
        $data['sobfeedback_id34'] = $sobfeedback->initFeedback(34);
		// Menu


		$this->load->model('catalog/product');

		$data['categories'] = array();



		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];

			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];

			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		// category
        $pos = strpos($data['class'], 'product-category');
		//  single product page
        $single = strpos($data['class'], 'product-product');

        if($pos !== false || $single !== false) {
            $this->load->model('catalog/category');
            if (isset($this->request->get['path'])) {
                $parts = explode('_', (string)$this->request->get['path']);
            } else {
                $parts = array();
            }

            if (isset($parts[0])) {
                $data['category_id'] = $parts[0];
            } else {
                $data['category_id'] = 0;
            }

            $data['categories'] = array();

            $categories = $this->model_catalog_category->getCategories(0);

            foreach ($categories as $category) {
                $children_data = array();

                if ($category['category_id'] == $data['category_id']) {
                    $children = $this->model_catalog_category->getCategories($category['category_id']);

                    foreach($children as $child) {
                        $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                        $children_data[] = array(
                            'category_id' => $child['category_id'],
                            'name' => $child['name']  ,
                            'top' => $child['top']  ,
                            'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                        );
                    }
                }

                $filter_data = array(
                    'filter_category_id'  => $category['category_id'],
                    'filter_sub_category' => true
                );

                $data['categories'][] = array(
                    'category_id' => $category['category_id'],
                    'name'        => $category['name']  ,
                    'top'        => $category['top']  ,
                    'children'    => $children_data,
                    'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

		return $this->load->view('common/header', $data);
	}
}
