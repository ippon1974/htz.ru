<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *"); // Adjust for security as needed
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Location: /api/post/order/makestone/mail.html");

$inputJSON = file_get_contents('php://input');
$data = json_decode($inputJSON, true);

if (json_last_error() === JSON_ERROR_NONE) {
	
	$user_check_private_agree = isset($data['user_check_private_agree']) ? $data['user_check_private_agree'] : 'Guest';
	$page_title = isset($data['page_title']) ? $data['page_title'] : 'Guest';
	$page_uri = isset($data['page_uri']) ? $data['page_uri'] : 'Guest';
	$dt = isset($data['dt']) ? $data['dt'] : 'Guest';
	$name = isset($data['name']) ? $data['name'] : 'Guest';
	$phone = isset($data['phone']) ? $data['phone'] : 'Guest';
	$email = isset($data['email']) ? $data['email'] : 'Guest';
	$message = isset($data['message']) ? $data['message'] : 'Guest';
	$check = isset($data['check']) ? $data['check'] : 'Guest';

    // Build the response
    $response = array(
		'user_check_private_agree' => '' . htmlspecialchars($user_check_private_agree),
		'page_title' => '' . htmlspecialchars($page_title),
		'page_uri' => '' . htmlspecialchars($page_uri),
		'dt' => '' . htmlspecialchars($dt),
		'name' => '' . htmlspecialchars($name),
		'phone' => '' . htmlspecialchars($phone),
		'email' => '' . htmlspecialchars($email),
		'message' => '' . htmlspecialchars($message),
		'check' => '' . htmlspecialchars($check)

		//'status' => 'success'
        //'mes' => 'Redirecting...'
        //'redirect_url' => 'http://htz.ru/api/post/order/makestone/mail.html'
    );
} else {
    // Handle invalid JSON payload
    $response = array(
        'status' => 'error',
        'message' => 'Invalid JSON received'
    );
}
echo json_encode($response);

$myfile = fopen("mail.json", "w") or die("Unable to open file!");
$json = $inputJSON;
$convertedText = iconv('UTF-8', 'Windows-1251', $json);
fwrite($myfile, $convertedText);
fclose($myfile);

//echo "<script>document.location.href='/api/post/order/makestone/mail.html'</script>";

?>