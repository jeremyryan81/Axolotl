<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name', 'Axolotl') }}</title>
    @vite(['resources/css/app.scss', 'resources/js/app.js'])
</head>
<body>
    <div id="app">
        <!-- Vue component example -->
        <example-component></example-component>
    </div>
</body>
</html>
