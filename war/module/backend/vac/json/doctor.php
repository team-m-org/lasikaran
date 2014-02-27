<?php
require("../includes/Db.class.php");
require("../classes/Doctor.php");
$mode 			= $_REQUEST['mode'];
$inputArr		= $_REQUEST;
switch($mode){
	case "save" :
			$arr = saveDoctorInfo($inputArr);
			break;
	default: 
			$arr = AuthUser($mobile,$password);
}
header('Content-type: application/json');
echo $_REQUEST['callback'] . '(' . json_encode($arr) . ');';
exit;
function saveDoctorInfo($inputArr){
		try {
			global $db;
			//server side validation
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
				$row_doc = $docObj->insertDocDetails($keyArr);
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

?>
