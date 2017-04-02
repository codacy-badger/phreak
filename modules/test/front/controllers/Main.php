<?php
namespace Modules\Test\Front\Controllers;
use System\Template;
use Modules\Test\Front\Models\Message as Model;

class Main {
    private $template, $model;

    public function __construct (Template $template, Model $model) {
        $this->template = $template;
        $this->model = $model;
    }

    /**
     *  function called from router->get
     *
     * @return void
     */
   public function showIndex()
    {
        $msg = $this->model->getMsg();
        return $this->template->display($msg);
    }    

}