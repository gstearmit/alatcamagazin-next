<?php

class Zend_Auth_Adapter_Facebook implements Zend_Auth_Adapter_Interface {

    private $token = null;
    private $user = null;

    public function __construct($token) {
        $this->token = $token;
    }

    public function getUser() {
        return $this->user;
    }

    public function authenticate() {
        if ($this->token == null) {
            return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID,
                            false, array('Token was not set'));
        }

        $graph_url = "https://graph.facebook.com/me?access_token=" . $this->token;
          $ch = curl_init();
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        //curl_setopt($ch, CURLOPT_PROXY, "http://172.16.1.1:8080");
        //curl_setopt($ch, CURLOPT_PROXYPORT, 8080);
          curl_setopt($ch, CURLOPT_URL, $graph_url);
          $data = curl_exec($ch);
          curl_close($ch);
	var_dump($data);	
        //print "page:" . htmlentities($x) . curl_error($ch);
        $details = json_decode($data);
               
        $email = $details->email;
		
        $modelUser = new HT_Model_home_models_User();
        $checkEmailExist = $modelUser->checkExistEmail($email);
		
        if($checkEmailExist == NULL){
            $dataUser['user_name'] = $email;
            $dataUser['pass'] = md5("wishFb");
            $dataUser['email'] = $email;
            $dataUser['firstname'] = $details->first_name;
            $dataUser['lastname'] = $details->last_name;
            $dataUser['sex'] = $details->gender == "male" ? "2" : "1";
            $dataUser['birthday'] = "0";
            $dataUser['reg_date'] = time();
            $dataUser['lang'] = "vn";
            $dataUser['role_id'] = "0";
            $dataUser['unit'] = "1";
            $modelUser->insert($dataUser);
            header("Location: http://wish.vn/user/auth/index/username/".$email."/password/wishFb");
            //header("/user/auth/index/username/".$email."/password/".md5("wishFb"));
        }else{
            
            $userName = $checkEmailExist['user_name'];
	
            $password = $checkEmailExist['pass'];
			
            header("Location: http://www.wish.vn/user/auth/index/username/".$userName."/password2/".$password."/password/true");
        }
        
        
      
        /* $user = lookUpUserInDB($details->email); // NOT AN ACTUALL FUNCTION
          if($user ==  false) { // first time login, register user
          //registerUser($user) // NOT AN ACTUAL FUNCTION
          }
          $this->user = $user;
          return new Zend_Auth_Result(Zend_Auth_Result::SUCCESS,$user); */
        
        
    }

}