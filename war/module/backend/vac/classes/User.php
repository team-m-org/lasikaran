<?php
require("../classes/UserLoginDetails.php");
class User
{
	private $db;
	public function __construct($db)
	{ 			
		$this->db = $db;	
	}
	public function getUserDetails($mobile=""){
		if($mobile){
			$array = array("mobile"=>$mobile);
			$result = $this->db->query("SELECT * FROM  user_details WHERE mobile = :mobile",$array);
		}else{
			$result = $this->db->query("SELECT * FROM  user_details");
		}
		return $result;
	}
	public function updateUserDetails($arr){
		//$arr 	=  array("user_name"=>"msikwal","user_id"=>"1")
		$update	=  $this->db->query("UPDATE user_details SET user_name = :user_name WHERE user_id = :user_id",$arr); 
		return $update;
	}
	public function insertUserDetails($input_arr){
		$authObj 	= new UserLoginDetails($this->db);
		$arrLogin 	=  array(
			"u_mobile"=>$input_arr['m_name'],
			"u_name"=>isset($input_arr['user_name']) ? 	$input_arr['user_name'] : "",
			"u_password"=>$input_arr['m_name'],
			"group_id" => "2"
		);
		
		$authObj->insertUserLogInDetails($arrLogin);
		$today = date("Y-m-d H:i:s");
		$arr 	=  array(
				"salutation"=>"Mr.",
				"first_name"=>"",
				"last_name"=>"",
				"mobile"=>$input_arr['m_name'],
				"refer_by_doc"=>$input_arr['doc_id'],
				"email" => "test@test.com",
				"address" =>"",
				"pincode" =>"",
				"location" =>"",
				"phone" =>"",
				"registration_date" =>$today,
				"group_id" => "2"
		);
		$insert	 =  $this->db->query("INSERT INTO user_details(salutation,first_name,last_name,mobile,refer_by_doc,email,address,pincode,location,phone,registration_date,group_id) VALUES(:salutation,:first_name,:last_name,:mobile,:refer_by_doc,:email,:address,:pincode,:location,:phone,:registration_date,:group_id)",$arr); 
		return $insert;
	}
}
?>