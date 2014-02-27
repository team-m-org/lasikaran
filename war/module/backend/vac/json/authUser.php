<?php
require("../includes/Db.class.php");
require("../classes/Doctor.php");
$mode		= substr($_REQUEST['mode'],0,3);
$inputArr	= $_REQUEST;
switch($mode){
	case "log" :
			$arr = AuthUser($inputArr);
			break;
	case "reg" :
			$arr = RegisterUser($inputArr);
			break;
	default: 
			
}
//header('Content-type: application/json');
//header('Content-type: application/javascript');
echo $_REQUEST['callback'] . '(' . json_encode($arr) . ');';
exit;
function RegisterUser($inputArr){
		try {
			global $db;
			foreach( $inputArr as $key => $key_value ){
				$keyArr[$key] = $key_value;
			}
			//print_r($keyArr);
			$docObj 		= new Doctor($db);
			$r_user 		= $docObj->getDocDetails($keyArr['mobile_num']);
			//print_r($r_user);
			if(is_array($r_user) && sizeof($r_user)>0){
				$arr = array('status' => "Mobile Number already exits!");
			}else{
				$row_doc 	= $docObj->insertDocDetails($keyArr);
				if($row_doc>0){
					$arr = array('status' => 1);
				}else{
					$arr = array('status' => 0);
				}
			}	
			return $arr;
		
		}catch(Exception $e) {
			echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
}
function AuthUser($inputArr){
		try {
			global $db;
			//validate on server side
			//$u_mobile 	= $inputArr['mobile_num'];
			//$u_password = $inputArr['u_pass'];
			//print_r($inputArr);
			$authObj 	= new UserLoginDetails($db);
			$result 	=  $authObj->validateUserDetails($inputArr);
			//print_r($result);		
			if(is_array($result) && sizeof($result)>0){
				
				$arr = array('status' => $result[0]['group_id']);
			}else{
				$arr = array('status' => 0);
			}
			return $arr;
		}catch(Exception $e) {
			echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
}		
?>