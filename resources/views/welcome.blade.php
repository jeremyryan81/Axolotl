<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name', 'Laravel') }}</title>
    @vite(['resources/css/app.scss', 'resources/js/app.js'])
</head>
<body>
    <div id="app">
        <example-component></example-component>
    </div>
</body>
</html>
