<?php
$path = getcwd();
$dir = opendir($path);
while(($file = readdir($dir)) !== false)
{
	#echo "filename: " . $file . "<br />";
	echo "<a href=$file>$file</a>" . "<br />";
}
?>