<?php

namespace Adduc\DomainTracker\Controller;
use Adduc\DomainTracker\App;
use Adduc\DomainTracker\View;
use Adduc\DomainTracker\Exception;
use Doctrine\Common\Inflector\Inflector;

class Controller {

    protected
        $app,
        $view,
        $layout,
        $viewVars = array();

    public function __construct(App $app = null) {
        $this->app = is_null($app) ? App::getInstance() : $app;
    }

    public function invoke($action, View $view = null, View $layout = null) {

        $action = Inflector::camelize($action);
        $action = $action . 'Action';

        $rc = new \ReflectionClass(get_called_class());
        $rm = $rc && $rc->hasMethod($action) ? $rc->getMethod($action) : false;

        if(!$rm) {
            throw new Exception\ActionDoesNotExist($callable);
        } elseif(!$rm->isPublic() || $rm->isStatic() || $rm->isAbstract()) {
            throw new Exception\ActionIsNotCallable($callable);
        }

        $class = get_called_class();
        $class = substr($class, (strrpos($class, '\\')?:-1)+1);

        $this->view = is_null($view)
            ? new View("{$class}/" . func_get_arg(0)) : $view;
        $this->layout = is_null($layout)
            ? new View("Layout/default") : $layout;

        $this->$action();
        $this->render();
    }

    public function set() {
        if(func_num_args() == 2 && is_string(func_get_arg(0))) {
            $this->viewVars[func_get_arg(0)] = func_get_arg(1);
        } elseif(func_num_args() == 1 && is_array(func_get_arg(0))) {
            $this->viewVars += $arr;
        } else {
            throw new \Exception('Unrecognized arguments.');
        }
    }

    public function render(View $view = null, View $layout = null, $data = null) {
        $view = is_null($view) ? $this->view : $view;
        $layout = is_null($layout) ? $this->layout : $layout;

        if(!is_array($data) && is_array($this->viewVars)) {
            $data = $this->viewVars;
        } else {
            throw new \Exception("viewVars must be an array at time of render.");
        }

        $data = is_null($data) || !is_array($data)
            ? $this->viewVars : $data;

        if($view) {
            $data['view'] = $view->render($data);
        }

        echo $layout ? $layout->render($data) : $data;


        $this->view = $this->layout = null;
    }
}
