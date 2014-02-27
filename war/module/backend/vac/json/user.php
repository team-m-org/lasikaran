<?php
		try {
			$username = "root";
			$password = "";
			$id = 1;
			$conn = new PDO('mysql:host=localhost;dbname=lasikaran', $username,$password);
			$stmt = $conn->prepare('SELECT * FROM doc_details WHERE mobile = :mobile and password = :u_pass');
			$stmt->execute(array('mobile' => $mobile,'u_pass' => $password));
			//$stmt = $conn->prepare('SELECT * FROM doc_details');
			//$stmt->execute();
	 		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
			$rowCount1 = $stmt->rowCount();
			echo "row====".$rowCount1;
			/*if (count($result) ) { 
				echo "<pre>";
				foreach($result as $row) {
					
					print_r($row);
				}   
				echo "</pre>";
			} else {
				echo "No rows returned.";
			}*/
   
		}catch(PDOException $e) {
			echo $e->getMessage();
		}
?>