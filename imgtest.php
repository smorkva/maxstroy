<?php

// Путь к ttf файлу шрифта
$font_file = './15695.ttf';

$height = 15;
$width = 202;
$text = "У тебя прекрасно получается петьУ тебя прекрасно получается петьУ тебя прекрасно получается петьУ тебя прекрасно получается петь";
//$text = 'получается петьУ';

$words = explode(' ', $text);
$lines = [];
$line = '';

foreach($words as $word){
	if(imageftbbox(15, 0, $font_file, implode(' ', [$line, $word]))[2] > $width){
		$lines[] = [$line, imageftbbox(15, 0, $font_file, $line)[2]];
		$line = '';
	}
	
	if(!$line){
		$line = $word;
	}else{
		$line .=  ' ' . $word;
	}
}
if($line){ $lines[] = [ $line, imageftbbox(15, 0, $font_file, $line)[2]]; }


$height = 24 * count($lines);
$im = imagecreatetruecolor($width, $height);
$white = imagecolorallocate($im, 0xFF, 0xFF, 0xFF);
$black = imagecolorallocate($im, 0x00, 0x00, 0x00);

// Сделаем красный фон
imagefilledrectangle($im, 0, 0, 202, $height, $white);

// Рисуем текст 'PHP Manual' шрифтом 13го размера
foreach($lines as $index => $line){
	imagefttext($im, 15, 0, ($width - $line[1])/2, 16 + 24 * ($index), $black, $font_file, $line[0]);
}//*/
//imagefttext($im, 15, 0, 0, 16, $black, $font_file, $lines[0][0]);
//print_r($lines);

// Вывод изображения
//header('Content-Type: image/png');

ob_start();
imagepng($im);
$buffer = ob_get_clean();
ob_end_clean();
echo base64_encode($buffer);

imagedestroy($im);