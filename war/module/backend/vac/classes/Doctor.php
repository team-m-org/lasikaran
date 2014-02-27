<?php
require("../classes/UserLoginDetails.php");
class Doctor
{
	private $db;
	public function __construct($db)
	{ 			
		$this->db = $db;	
	}
	public function getDocDetails($id=""){
		if($id){
			$array = array("mobile"=>$id);
			$result = $this->db->query("SELECT * FROM  doc_details WHERE mobile = :mobile",$array);
		}else{
			$result = $this->db->query("SELECT * FROM  doc_details");
		}
		return $result;
	}
	public function updateDocDetails($arr){
		//$arr 	=  array("doc_name"=>"msikwal","doc_id"=>"1")
		$update	=  $this->db->query("UPDATE doc_details SET doc_name = :doc_name WHERE doc_id = :doc_id",$arr); 
		return $update;
	}
	public function insertDocDetails($arr){
		$authObj 	= new UserLoginDetails($this->db);
		$today = date("Y-m-d H:i:s");
		$arrDoc 	=  array(
					"doc_name"=>isset($arr['f_name']) ? $arr['f_name'] : "" ,
					"mobile"=>isset($arr['mobile_num']) ?$arr['mobile_num'] : "",
					"password"=>isset($arr['u_pass']) ? $arr['u_pass'] : "",
					"email" => isset($arr['doc_email']) ? $arr['doc_email'] : "",
					"address" =>isset($arr['address']) ? $arr['address'] : "" ,
					"pincode" =>isset($arr['pincode']) ? $arr['pincode'] : "" ,
					"location" =>isset($arr['location']) ? $arr['location'] : "" ,
					"phone" =>"",
					"text_msg" =>isset($arr['wel_msg']) ? $arr['wel_msg'] : "" ,
					"per_patient_amt" =>isset($arr['per_patient_amt']) ? $arr['per_patient_amt'] : "50" ,
					"registration_date" =>$today,
					"group_id" => "1"
		);
		
		$arrLogin 	=  array(
				"u_mobile"=>isset($arr['mobile_num']) ? $arr['mobile_num'] : "",
				"u_name"=>isset($arr['user_name']) ? 	$arr['user_name'] : "",
				"u_password"=>isset($arr['u_pass']) ? $arr['u_pass'] : "",
				"group_id" => "1"
		);
		
		$authObj->insertUserLogInDetails($arrLogin);	
		$insert	 =  $this->db->query("INSERT INTO doc_details(doc_name,mobile,password,email,address,pincode,location,phone,text_msg,per_patient_amt,registration_date,group_id) VALUES(:doc_name,:mobile,:password,:email,:address,:pincode,:location,:phone,:text_msg,:per_patient_amt,:registration_date,:group_id)",$arrDoc); 
		return $insert;
	}
}
?>