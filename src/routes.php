<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile;

// Routes

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

// get list active survey
$app->get("/active_survey/", function (Request $request, Response $response){
    $sql = "SELECT * FROM tb_survey";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

// get list survey
$app->get("/survey/", function (Request $request, Response $response){
    $sql = "SELECT * FROM tb_survey";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

// get list question based id survey
$app->get("/question/{id_survey}", function (Request $request, Response $response, $args){
    $id = $args["id_survey"];
    $sql = "SELECT * FROM tb_question WHERE id_survey=:id_survey";
    $stmt = $this->db->prepare($sql);
    $stmt->execute([":id_survey" => $id]);
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});


// post create survey
$app->post("/survey/", function (Request $request, Response $response){

    $new_survey = $request->getParsedBody();

    $sql = "INSERT INTO tb_survey (id_survey, nama_survey, created_at, modified_at) VALUE (NULL, :nama_survey, NULL, NULL)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":nama_survey" => $new_survey["nama_survey"]
    ];

    if($stmt->execute($data))
       return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

// post create question
$app->post("/question/", function (Request $request, Response $response){

    $new_question = $request->getParsedBody();

    $sql = "INSERT INTO tb_question (id_question, tipe_question, question, option_1, option_2, option_3, option_4, id_survey) VALUE (NULL, :tipe_question, :question, :option_1, :option_2, :option_3, :option_4, :id_survey)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":tipe_question" => $new_question["tipe_question"],
        ":question" => $new_question["question"],
        ":option_1" => $new_question["option_1"],
        ":option_2" => $new_question["option_2"],
        ":option_3" => $new_question["option_3"],
        ":option_4" => $new_question["option_4"],
        ":id_survey" => $new_question["id_survey"]
    ];

    if($stmt->execute($data))
       return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});