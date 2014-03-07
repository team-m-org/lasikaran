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
		
		$arrDoc 	=  array(
					"first_name"=>isset($arr['f_name']) ? $arr['f_name'] : "" ,
					"last_name"=>isset($arr['l_name']) ? $arr['l_name'] : "" ,
					"mobile"=>isset($arr['mobile_num']) ?$arr['mobile_num'] : "",
					//"password"=>isset($arr['u_pass']) ? $arr['u_pass'] : "",
					"email" => isset($arr['doc_email']) ? $arr['doc_email'] : "",
					//"address" =>isset($arr['address']) ? $arr['address'] : "" ,
					//"pincode" =>isset($arr['pincode']) ? $arr['pincode'] : "" ,
					//"location" =>isset($arr['location']) ? $arr['location'] : "" ,
					//"phone" =>"",
					"text_msg" =>isset($arr['wel_msg']) ? $arr['wel_msg'] : "" 
					//"per_patient_amt" =>isset($arr['per_patient_amt']) ? $arr['per_patient_amt'] : "50" ,
					
					
		);
		//echo"<pre>";
		//print_r($arr);
		//print_r($arrDoc);
		//echo"</pre>";
		//exit;
		$update	 =  $this->db->query("UPDATE doc_details set first_name = :first_name,last_name = :last_name,email = :email,text_msg = :text_msg where mobile = :mobile ",$arrDoc); 
		//echo"<pre>";
		if($update===0){
			return 1;
		}else{
			return 0;
		}
		//var_dump($update);
		//echo"</pre>";
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
		$insert	 =  $this->db->query("INSERT INTO doc_details(first_name,mobile,password,email,address,pincode,location,phone,text_msg,per_patient_amt,registration_date,group_id) VALUES(:doc_name,:mobile,:password,:email,:address,:pincode,:location,:phone,:text_msg,:per_patient_amt,:registration_date,:group_id)",$arrDoc); 
		return $insert;
	}
}
?>