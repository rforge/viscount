
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="http://<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body bgcolor="#FEFCFF">

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="http://r-forge.r-project.org/"><img src="http://<?php echo $themeroot; ?>/imagesrf/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<font face="helvetica, verdana, arial"> 

<?php if ($handle=fopen('http://'.$domain.'/export/projtitl.php?group_name='.$group_name,'r')){
$contents = '';
while (!feof($handle)) {
	$contents .= fread($handle, 8192);
}
fclose($handle);
echo $contents; } ?>

<!-- end of project description -->

<p> <b><i><big>VisCount</big></i></b> allows you to train rapid visual estimates of the number of individuals (symbols) in the plotting window, enter your estimates, and get a series of insightful statistics on your performance and how it evolves along different training sessions.</p>

<p> To <b><big>install</big></b> the package directly from R-Forge, paste the following command in the R console (when connected to the internet):</p>
<code>
install.packages("VisCount", repos="http://R-Forge.R-project.org")<br />
</code>

<p>If the command above fails, producing a message like "<i>package 'VisCount' is not available for your R version</i>", you can download the compressed package source files to your disk (<i>.zip</i> or <i>.tar.gz</i> available <a href="https://r-forge.r-project.org/R/?group_id=1923">here</a>) and then install the package from there (R menu "<i>Packages - Install packages from local zip files</i>", or "<i>Tools - Install packages - Install from: Package Archive File</i>", or "Packages & Data - Package installer, Packages repository - Local binary package", ... depending on your R menu interface).</p>

<p>You only need to install the package once, but then every time you re-open R you need to <b><big>load</big></b> it by typing:</p>
<code>
library(VisCount)<br />
</code>

<p>You can then check out the package help files and try out the provided <b><big>examples</big></b> to get a sense of the <i>VisCount</i> workflow:</p>
<code>
help("VisCount")<br />
</code>

<p> There is also a <b>forthcoming article</b> about the package containing applications and general user guidelines. The provisional reference is:</p>

<p><i> Barbosa A.M. (submitted) VisCount: a free software tool to train and evaluate visual count estimates.</i></p>

<p> The project summary page you can find <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>here</strong></a>. </p>

<!--img src="VisCount_hats.jpeg"-->
<!--img src="VisCount_tildes.jpeg"-->
<!--img src="VisCount_stats.jpeg"-->

</font>
</body>
</html>
