<?php
header("Content-Type: application/json; charset=UTF-8");
require_once "db_config.php";

try {
    // Fetch all destinations
    $stmt = $pdo->prepare("SELECT * FROM destinations");
    $stmt->execute();
    $destinations = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $tourData = [];

    foreach ($destinations as $dest) {
        $key = strtolower($dest['title']);
        $tourData[$key] = [
            'title' => $dest['title'],
            'subtitle' => $dest['subtitle'],
            'heroImage' => $dest['heroImage'],
            'introduction' => $dest['introduction'],
            'culture' => $dest['culture'],
            'bestTime' => $dest['bestTime'],
            'conclusion' => $dest['conclusion'],
            'gallery' => [],
            'attractions' => [],
        ];

        // Fetch gallery images
        $gallery_stmt = $pdo->prepare("SELECT image_url FROM gallery WHERE destination_id = :id");
        $gallery_stmt->bindParam(":id", $dest['id'], PDO::PARAM_INT);
        $gallery_stmt->execute();
        $gallery_images = $gallery_stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        $tourData[$key]['gallery'] = $gallery_images;

        // Fetch attractions
        $attractions_stmt = $pdo->prepare("SELECT name, description FROM attractions WHERE destination_id = :id");
        $attractions_stmt->bindParam(":id", $dest['id'], PDO::PARAM_INT);
        $attractions_stmt->execute();
        $attractions = $attractions_stmt->fetchAll(PDO::FETCH_ASSOC);
        $tourData[$key]['attractions'] = array_map(function($attr) {
            return ['name' => $attr['name'], 'desc' => $attr['description']];
        }, $attractions);
    }

    echo json_encode($tourData);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}

unset($pdo);
?>
