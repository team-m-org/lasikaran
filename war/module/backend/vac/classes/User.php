<?php
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
		$arr 	=  array(
					"user_name"=>$input_arr['m_name'],
					"mobile"=>$input_arr['m_name'],
					"password"=>$input_arr['m_name'],
					"email" => "test@test.com",
					"address" =>"",
					"pincode" =>"",
					"location" =>"",
					"phone" =>"02233",
					"group_id" => "2"
			);
			$insert	 =  $this->db->query("INSERT INTO user_details(user_name,mobile,password,email,address,pincode,location,phone,group_id) VALUES(:user_name,:mobile,:password,:email,:address,:pincode,:location,:phone,:group_id)",$arr); 
			return $insert;
	}
}
?>