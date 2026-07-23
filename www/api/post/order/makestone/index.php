<?php
header("Content-Type: application/json; charset=UTF-8");
//header("Access-Control-Allow-Origin: *"); // Adjust for security as needed
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$inputJSON = file_get_contents('php://input');
$data = json_decode($inputJSON, true);

if (json_last_error() === JSON_ERROR_NONE) {
    
    $name = isset($data['name']) ? $data['name'] : 'Guest';
	$surname = isset($data['surname']) ? $data['surname'] : 'GuestSur';

    // Build the response
    $response = array(
        "status" => "success",
        'message' => 'Hello, ' . htmlspecialchars($name),
		'age' => 'Hello, ' . htmlspecialchars($surname)
    );
} else {
    // Handle invalid JSON payload
    $response = array(
        'status' => 'error',
        'message' => 'Invalid JSON received'
    );
}
echo json_encode($response);
?>