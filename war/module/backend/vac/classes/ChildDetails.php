<?php
class ChildDetails
{
	private $db;
	public function __construct($db)
	{ 			
		$this->db = $db;	
	}
	public function getChildDetails($id=""){
		if($id){
			$array = array("doc_id"=>$id);
			$result = $this->db->query("SELECT * FROM  child_details WHERE child_id = :id",$array);
		}else{
			$result = $this->db->query("SELECT * FROM  child_details");
		}
		return $result;
	}
	public function searchChildDetails($id=""){
		if($id){
			$array = array("doc_id"=>$id);
			$result = $this->db->query("SELECT * FROM  child_details WHERE child_id = :id",$array);
		}else{
			$result = $this->db->query("SELECT * FROM  child_details");
		}
		return $result;
	}
	public function updateChildDetails($arr){
		//$arr 	=  array("doc_name"=>"msikwal","doc_id"=>"1")
		$update	=  $this->db->query("UPDATE child_details SET child_name = :child_name WHERE child_id = :child_id",$arr); 
		return $update;
	}
	public function insertChildDetails($arr){
		$arr 	=  array(
					"child_name"=>$arr['c_name'],
					"birth_date"=>$arr['b_date'],
					"parent_id"=>$arr['parentId'],
					"gender" =>$arr['genderRadios']
				);
		$insert	 =  $this->db->query("INSERT INTO child_details(child_name,birth_date,parent_id,gender) VALUES(:child_name,:birth_date,:parent_id,:gender)",$arr); 
		return $insert;
	}
}
?>