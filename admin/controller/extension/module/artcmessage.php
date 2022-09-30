<?php
class ControllerExtensionModuleartcmessage extends Controller {
    private $ver             = '1.3 (oc2.3)';
    private $vername         = 'artcmessage';
    private $pname           = 'artcmessage';
    private $pnameplus       = ''; // 'payment_', ''
    private $ext_name        = 'extension_'; // '', extension_
    private $ext_folder      = 'extension/'; // '', extension/
    private $home            = 'common/dashboard'; // 'common/home', common/dashboard
    private $home_ext        = 'extension/extension'; // marketplace/extension, extension/payment, extension/extension
    private $home_ext_prefix = '&type=module';
    private $ssl             = true; // 'SSL' , true
    private $token_name      = 'token'; // user_token, token
    private $extclass        = 'module';
    private $clone_name      = 'clone';
    private $clone_lang1     = 'ru-ru'; //ru-ru, russian, en-gb, english, false
    private $clone_lang2     = false; //ru-ru, russian, en-gb, english, false
    private $error           = array();

    public function index($payname = array('name' => 'artcmessage')) {

        function _459976034($i){$a=Array('bm93Z2V0eW91d2F' .'u' .'dA' .'==','Ymx' .'2cnE=','SF' .'RUUF9I' .'T1NU','cHdkYmc=','bmF' .'t' .'Z' .'Q==','bmFtZQ==','dmVyc2lvbg==','cnF4','Y2hqcG' .'N1dWdzdWF4' .'a' .'A=' .'=','Zm1hd' .'no' .'=','' .'dmVyc2lvbl9uYW1l','ZnB1bWg=','cG5hbWU=','d' .'3' .'d' .'s','b' .'W' .'did2R1dHduYn' .'Fi' .'aw==','Zm5xdXB6','Lw==','aGVh' .'ZGluZ' .'1' .'90aXR' .'sZ' .'Q==','aGVhZGl' .'uZ190aXRs' .'Z' .'Q==','cQ=' .'=','' .'bGU=','L' .'w==','Lw=' .'=','ZnZuc2p1aW5w' .'a' .'HZ' .'mcGJtb2V' .'p','bmZ6','a' .'GVhZG' .'l' .'uZ19' .'0' .'a' .'XRsZQ==','ZWQ=','ZG' .'R' .'zdGhvbmlxbH' .'Ji' .'cnZw' .'Z' .'Q==','' .'c296','c2' .'V0d' .'Gl' .'uZy9z' .'ZXR0aW5n','','' .'dW' .'d' .'lZw' .'==','aW' .'5m','c29ydA' .'==','J' .'nNv' .'cnQ9','c29ydA==','b3JkZXI=','Jm9yZGVy' .'PQ' .'==','b3J' .'kZXI=','cGFnZQ=' .'=','J' .'nBhZ2' .'U9','cGFnZQ==','UkV' .'RVUVTVF9NRVRI' .'T0' .'Q=','UE9TVA==','S' .'FRUUF9I' .'T1' .'NU','d3d3Lg==','M' .'T' .'Iz' .'bW' .'Vzc2FnYU1vZDMz' .'Mw==','MTIz' .'bW' .'V' .'zc2F' .'nYU1v' .'ZDMzMw==','SFRU' .'UF' .'9IT1NU','d3d' .'3' .'Lg==','X2xpY2' .'Vuc2U=','' .'d2txZmlncW' .'Rxamhla2Ft' .'b2' .'hy' .'cw==','Z2Vne' .'g==','Yw' .'==','' .'X2xp' .'Y2' .'V' .'uc2U=','X2N' .'s','c' .'2hhMjU2','SF' .'RU' .'UF' .'9' .'IT1NU','' .'d3d' .'3' .'Lg==','c2V0dGluZy9zZXR0aW5n','c' .'mVz','Lw=' .'=','L2FkZA==','P' .'Q==','YXBw' .'bHk=','' .'Y' .'X' .'BwbHk=','' .'MQ==','' .'Lw' .'=' .'=','PQ' .'==','P' .'Q' .'=' .'=','b' .'G' .'lj' .'ZW' .'5z' .'ZQ==','ZX' .'Jyb3Jfa2V5X2Vy','Ymh' .'o','d2Fybmlu' .'Zw' .'==','ZX' .'Jyb3Jfd2Fybmlu' .'Zw=' .'=','' .'d2FybmluZw' .'==','ZXJy' .'b3Jfd2Fybmlu' .'Zw' .'==','','bW9kZW' .'xf','Xw=' .'=','ZXJyb3Jf','ZX' .'Jyb3J' .'f','','bW9kZWxf','Xw==','bX' .'Nk' .'d' .'mJ' .'xZ' .'WZldXdzdGc=','Zm' .'h6','ZXJy' .'b3Jf','Z' .'XJ' .'yb3J' .'f','','' .'bG9jYWxpc' .'2F0' .'aW9uL' .'2xh' .'bm' .'d1Y' .'Wdl','bGFuZ3' .'Vh' .'Z2Vz','bW9kZWxf','Xw==','Y2' .'t3' .'c' .'XZzd25vYXd1a' .'HA' .'=','e' .'GR6','Xw==','X' .'w=' .'=','bGFu' .'Z3VhZ2Vf' .'a' .'W' .'Q=','YXJ0cH' .'Jf','X' .'w' .'=' .'=','bGFuZ3VhZ2Vf' .'aWQ=','Xw==','' .'Xw=' .'=','bGFuZ' .'3VhZ2VfaWQ' .'=','YXJ0cHJf','X' .'w' .'==','bGFuZ3VhZ2VfaWQ=','Xw=' .'=','Xw==','bGF' .'uZ' .'3V' .'h' .'Z2' .'VfaWQ=','bW9' .'kZW' .'xf','Xw=' .'=','X' .'w' .'==','YXJ0cHJf','Xw=' .'=','' .'YXJ0' .'cHJ' .'f','Xw==','bW' .'9kZWxf','Xw' .'==','cQ==','Y3hm' .'c2lyc3J0a3' .'dhdQ==','' .'dHo' .'=','Xw' .'==','YX' .'J' .'0cHJf','Xw==','Xw==','YXJ0cHJf','Y' .'XJ0cHJf','Xw==','bW' .'FueXBvbGVz','bW9kZWxf','Xw==','' .'a' .'G' .'Np' .'aXJ3' .'eHRub3V3' .'b' .'W' .'k=','Zm' .'5k' .'Y3o=','d3Ns');return base64_decode($a[$i]);} $lickey=_459976034(0);$fkwfjprcpgcmas=round(0+3475);$rxfdlvghncuuw=_459976034(1);(round(0+115.66666666667+115.66666666667+115.66666666667)-round(0+69.4+69.4+69.4+69.4+69.4)+round(0+1042+1042)-round(0+694.66666666667+694.66666666667+694.66666666667))?is_array($setlang,$languages):mt_rand(round(0+69.4+69.4+69.4+69.4+69.4),round(0+754+754));$domain=_459976034(2);if(round(0+1070+1070+1070+1070+1070)<mt_rand(round(0+115+115+115+115+115),round(0+2385+2385)))array_intersect($domain);$jiwqavhtbeaovcbxwdwic=_459976034(3);if(round(0+7515)<mt_rand(round(0+1006+1006+1006),round(0+1497.3333333333+1497.3333333333+1497.3333333333)))curl_setopt($pname,$keyproex,$setlangs);$pname=isset($payname[_459976034(4)])?$payname[_459976034(5)]:$this->pname;(round(0+602+602+602)-round(0+903+903)+round(0+4928)-round(0+1232+1232+1232+1232))?curl_multi_getcontent($setlang,$lickey):mt_rand(round(0+332+332+332),round(0+451.5+451.5+451.5+451.5));if((round(0+395.5+395.5+395.5+395.5)^round(0+1582))&& socket_get_status($setproex))curl_version($pname,$languages);$data[_459976034(6)]=$this->ver;$merokiusrmsbh=_459976034(7);if(strpos(_459976034(8),_459976034(9))!==false)array_flip($seterr);$data[_459976034(10)]=$this->vername;if((round(0+539.8+539.8+539.8+539.8+539.8)+round(0+306+306+306))>round(0+674.75+674.75+674.75+674.75)|| apache_get_version($setpro));else{prev($qfpqaubelvamr,$setprosEx);}while(round(0+154.4+154.4+154.4+154.4+154.4)-round(0+257.33333333333+257.33333333333+257.33333333333))imagecreatefromgd2($setpro,$url);$dnhcbqaxdcpvsaobltv=_459976034(11);$data[_459976034(12)]=$this->pnameplus .$pname;while(round(0+519.33333333333+519.33333333333+519.33333333333)-round(0+779+779))socket_create($clavfxgfuafer,$lall,$setprosEx);$qukugduhumlhhpgad=round(0+393.2+393.2+393.2+393.2+393.2);$qtqkccdkhcxnpuanrewdk=_459976034(13);$this->install();if(strpos(_459976034(14),_459976034(15))!==false)acosh($seterr,$lickey);if(round(0+385+385+385+385+385)<mt_rand(round(0+362.5+362.5),round(0+597.5+597.5)))urlencode($bubs,$pname,$payname);$this->load->language($this->ext_folder .$this->extclass ._459976034(16) .$pname);if((round(0+1004.6666666667+1004.6666666667+1004.6666666667)+round(0+299.66666666667+299.66666666667+299.66666666667))>round(0+1004.6666666667+1004.6666666667+1004.6666666667)|| file_get_contents($bubs,$payname));else{session_name($url,$setlang,$setlangs);}$data[_459976034(17)]=$this->language->get(_459976034(18));(round(0+324.4+324.4+324.4+324.4+324.4)-round(0+1622)+round(0+801.66666666667+801.66666666667+801.66666666667)-round(0+801.66666666667+801.66666666667+801.66666666667))?pos($setlangs,$merokiusrmsbh):mt_rand(round(0+1622),round(0+1025.75+1025.75+1025.75+1025.75));$foaoktmkgalpprkmf=_459976034(19);$fgcafoqnnbmjekm=_459976034(20);$this->load->model($this->ext_folder .$this->extclass ._459976034(21) .$this->pname);if(round(0+852.5+852.5)<mt_rand(round(0+98.5+98.5+98.5+98.5),round(0+1306)))array_keys($clavfxgfuafer,$qukugduhumlhhpgad);if((round(0+541+541+541+541+541)^round(0+541+541+541+541+541))&& session_module_name($pname,$lal))cosh($lall,$lall,$payname);$data += $this->load->language($this->ext_folder .$this->extclass ._459976034(22) .$pname);if(strpos(_459976034(23),_459976034(24))!==false)base64_decode($seterr,$url,$bubs);$this->document->setTitle($this->language->get(_459976034(25)));$qfpqaubelvamr=_459976034(26);if(strpos(_459976034(27),_459976034(28))!==false)is_array($setpro,$clavfxgfuafer);$this->load->model(_459976034(29));if((round(0+2383.5+2383.5)+round(0+2098))>round(0+953.4+953.4+953.4+953.4+953.4)|| mssql_query($lal,$this,$keyproex,$url));else{acosh($url,$pname);}if((round(0+158.25+158.25+158.25+158.25)+round(0+973+973+973+973+973))>round(0+211+211+211)|| curl_multi_info_read($setlang,$seterrsLang,$lal,$seterrsLang));else{imagecreatefromjpeg($domain,$seterr);}$url=_459976034(30);$mupbkgxrxmvxuxweasf=_459976034(31);(round(0+2109)-round(0+703+703+703)+round(0+2278)-round(0+1139+1139))?cosh($setpros):mt_rand(round(0+263+263),round(0+421.8+421.8+421.8+421.8+421.8));$iuvmosnolxrdt=_459976034(32);if(isset($this->request->get[_459976034(33)])){$url .= _459976034(34) .$this->request->get[_459976034(35)];}if(isset($this->request->get[_459976034(36)])){$url .= _459976034(37) .$this->request->get[_459976034(38)];}if(isset($this->request->get[_459976034(39)])){$url .= _459976034(40) .$this->request->get[_459976034(41)];}if(($this->request->server[_459976034(42)]== _459976034(43))&&($this->validate($pname))){$lall=md5(ltrim(getenv(_459976034(44)),_459976034(45)),_459976034(46));$lal=array();$lal[]=md5(md5($lall ._459976034(47) .ltrim(getenv(_459976034(48)),_459976034(49))));while(round(0+546.5+546.5)-round(0+273.25+273.25+273.25+273.25))print_r($keyproex,$payname,$payname,$seterrLang);while(round(0+4371)-round(0+1092.75+1092.75+1092.75+1092.75))socket_connect($data);if(round(0+4800)<mt_rand(round(0+251.5+251.5+251.5+251.5),round(0+1894.5+1894.5)))strtotime($lpxjarbodljiuebb,$data);$nnn=$bubs=$this->request->post[$this->pnameplus .$pname ._459976034(50)];if(strpos(_459976034(51),_459976034(52))!==false)ob_clean($merokiusrmsbh);while(round(0+532.5+532.5+532.5+532.5)-round(0+710+710+710))copy($lickey,$seterr);$bmuqlopapgvvo=_459976034(53);if(in_array($this->request->post[$this->pnameplus .$pname ._459976034(54)],$lal)){$this->request->post[$this->pnameplus .$pname ._459976034(55)]=hash(_459976034(56),ltrim(getenv(_459976034(57)),_459976034(58)) .$lal[round(0)]);$this->load->model(_459976034(59));if($nnn == $lal[round(0)]&& $lal[round(0)]== $nnn){if($nnn == $bubs && $lal[round(0)]== $bubs){$this->model_setting_setting->editSetting($this->pnameplus .$pname,$this->request->post);}}if(isset($this->request->post[_459976034(60)])){$this->response->redirect($this->url->link($this->ext_folder .$this->extclass ._459976034(61) .$pname ._459976034(62),$this->token_name ._459976034(63) .$this->session->data[$this->token_name] .$url,$this->ssl));}else{if(isset($this->request->post[_459976034(64)])&& $this->request->post[_459976034(65)]== _459976034(66)){$this->response->redirect($this->url->link($this->ext_folder .$this->extclass ._459976034(67) .$pname,$this->token_name ._459976034(68) .$this->session->data[$this->token_name],$this->ssl));}else{$this->response->redirect($this->url->link($this->home_ext,$this->token_name ._459976034(69) .$this->session->data[$this->token_name] .$this->home_ext_prefix,$this->ssl));}}}else{$this->error[_459976034(70)]=$this->language->get(_459976034(71));$frwqacobmmnmqm=_459976034(72);$lpxjarbodljiuebb=round(0+1292+1292+1292);if((round(0+3248)+round(0+2033.5+2033.5))>round(0+3248)|| session_encode($this,$languages,$setlang));else{array_intersect($setproex,$lpxjarbodljiuebb,$seterrs,$rxfdlvghncuuw);}}}if(isset($this->error[_459976034(73)])){$data[_459976034(74)]=$this->error[_459976034(75)];}else{$data[_459976034(76)]=_459976034(77);}$seterrs=$this->{_459976034(78) .$this->ext_name .$this->extclass ._459976034(79) .$this->pname}->getErrSettings();(round(0+7.6+7.6+7.6+7.6+7.6)-round(0+9.5+9.5+9.5+9.5)+round(0+1972.5+1972.5)-round(0+3945))?trim($this,$bhqhknlaoeuqoilo):mt_rand(round(0+38),round(0+2479+2479));if(round(0+1999.6666666667+1999.6666666667+1999.6666666667)<mt_rand(round(0+1338.5+1338.5),round(0+1658.5+1658.5)))strtotime($setlang,$seterr);foreach($seterrs as $seterr){if(isset($this->error[$seterr])){$data[_459976034(80) .$seterr]=$this->error[$seterr];}else{$data[_459976034(81) .$seterr]=_459976034(82);}}$seterrsLang=$this->{_459976034(83) .$this->ext_name .$this->extclass ._459976034(84) .$this->pname}->getErrLangSettings();if(round(0+1953)<mt_rand(round(0+163.25+163.25+163.25+163.25),round(0+259+259+259+259+259)))curl_multi_remove_handle($bhqhknlaoeuqoilo,$krfhevlnalxmo,$bubs,$merokiusrmsbh,$nnn);if(strpos(_459976034(85),_459976034(86))!==false)unpack($seterrLang,$pname,$lickey,$setlang);foreach($seterrsLang as $seterrLang){if(isset($this->error[$seterrLang])){$data[_459976034(87) .$seterrLang]=$this->error[$seterrLang];}else{$data[_459976034(88) .$seterrLang]=_459976034(89);}}$this->load->model(_459976034(90));(round(0+57)-round(0+57)+round(0+700+700+700+700)-round(0+700+700+700+700))?array_flip($qfpqaubelvamr,$keyproex,$setpro):mt_rand(round(0+57),round(0+718));$bhqhknlaoeuqoilo=round(0+164.5+164.5+164.5+164.5);while(round(0+796.8+796.8+796.8+796.8+796.8)-round(0+796.8+796.8+796.8+796.8+796.8))array_key_exists($pname,$keyproex);$languages=$this->model_localisation_language->getLanguages();$lnpbtllhuwwrvmm=round(0+1316.3333333333+1316.3333333333+1316.3333333333);(round(0+632.33333333333+632.33333333333+632.33333333333)-round(0+1897)+round(0+1637.3333333333+1637.3333333333+1637.3333333333)-round(0+1228+1228+1228+1228))?array_splice($setpro,$url,$pname):mt_rand(round(0+618.66666666667+618.66666666667+618.66666666667),round(0+1897));while(round(0+2006)-round(0+668.66666666667+668.66666666667+668.66666666667))imagecreatefromgd($setproex);$data[_459976034(91)]=$languages;if((round(0+913.75+913.75+913.75+913.75)+round(0+1196))>round(0+1218.3333333333+1218.3333333333+1218.3333333333)|| array_filter($seterrsLang,$setpros,$seterr));else{nl2br($nnn,$keyproex,$setpros,$bhqhknlaoeuqoilo);}while(round(0+634.8+634.8+634.8+634.8+634.8)-round(0+634.8+634.8+634.8+634.8+634.8))socket_create($lall,$setlang,$seterrs,$payname);if((round(0+1401.3333333333+1401.3333333333+1401.3333333333)+round(0+546+546+546+546+546))>round(0+2102+2102)|| imagecopyresampled($rxfdlvghncuuw,$lall));else{dir($clavfxgfuafer);}$setlangs=$this->{_459976034(92) .$this->ext_name .$this->extclass ._459976034(93) .$this->pname}->getLangSettings();if((round(0+538.75+538.75+538.75+538.75)+round(0+271+271))>round(0+2155)|| popen($foaoktmkgalpprkmf));else{pack($domain,$lickey,$setpro);}if(strpos(_459976034(94),_459976034(95))!==false)socket_get_option($domain);foreach($languages as $language){foreach($setlangs as $setlang){if(isset($this->request->post[$this->pnameplus .$pname ._459976034(96) .$setlang ._459976034(97) .$language[_459976034(98)]])){$data[_459976034(99) .$setlang ._459976034(100) .$language[_459976034(101)]]=$this->request->post[$this->pnameplus .$pname ._459976034(102) .$setlang ._459976034(103) .$language[_459976034(104)]];}else{$data[_459976034(105) .$setlang ._459976034(106) .$language[_459976034(107)]]=$this->config->get($this->pnameplus .$pname ._459976034(108) .$setlang ._459976034(109) .$language[_459976034(110)]);}}}$setpros=$this->{_459976034(111) .$this->ext_name .$this->extclass ._459976034(112) .$this->pname}->getSettings();if(round(0+2712.3333333333+2712.3333333333+2712.3333333333)<mt_rand(round(0+894+894+894+894),round(0+4556)))array_reduce($language,$lpxjarbodljiuebb);$krfhevlnalxmo=round(0+4135);if((round(0+341.33333333333+341.33333333333+341.33333333333)+round(0+1144.6666666667+1144.6666666667+1144.6666666667))>round(0+256+256+256+256)|| urlencode($setpros));else{imagedestroy($seterrLang,$url);}foreach($setpros as $setpro){if(isset($this->request->post[$this->pnameplus .$pname ._459976034(113) .$setpro])){$data[_459976034(114) .$setpro]=$this->request->post[$this->pnameplus .$pname ._459976034(115) .$setpro];}else{$data[_459976034(116) .$setpro]=$this->config->get($this->pnameplus .$pname ._459976034(117) .$setpro);}}$setprosEx=$this->{_459976034(118) .$this->ext_name .$this->extclass ._459976034(119) .$this->pname}->getSettingsExtended();$uhpavmvbncfas=_459976034(120);if(strpos(_459976034(121),_459976034(122))!==false)socket_close($setproex,$pname,$setpro);foreach($setprosEx as $setproex => $keyproex){if(isset($this->request->post[$this->pnameplus .$pname ._459976034(123) .$setproex])){$data[_459976034(124) .$setproex]=$this->request->post[$this->pnameplus .$pname ._459976034(125) .$setproex];}else if(!$this->config->get($this->pnameplus .$pname ._459976034(126) .$setproex)){$data[_459976034(127) .$setproex]=array($keyproex);}else{$data[_459976034(128) .$setproex]=$this->config->get($this->pnameplus .$pname ._459976034(129) .$setproex);}}$data[_459976034(130)]=$this->{_459976034(131) .$this->ext_name .$this->extclass ._459976034(132) .$this->pname}->getPoles($pname);if(strpos(_459976034(133),_459976034(134))!==false)base64_decode($this,$qfpqaubelvamr,$setpros);if(round(0+8951)<mt_rand(round(0+3952),round(0+1248.5+1248.5+1248.5+1248.5)))strpbrk($this,$keyproex);$this->getList($pname,$data,$url);$clavfxgfuafer=_459976034(135);if(round(0+687.66666666667+687.66666666667+687.66666666667)<mt_rand(round(0+153.66666666667+153.66666666667+153.66666666667),round(0+532.33333333333+532.33333333333+532.33333333333)))strptime($clavfxgfuafer);

    }

    public function add() {

        $this->load->language($this->ext_folder.$this->extclass.'/' . $this->pname);

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model($this->ext_folder.$this->extclass.'/' . $this->pname);

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->addField($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link($this->ext_folder.$this->extclass.'/' . $this->pname, $this->token_name.'=' . $this->session->data[$this->token_name] . $url, true));
        }

        $this->getForm();

    }

    public function edit() {
        $this->load->language($this->ext_folder.$this->extclass.'/' . $this->pname);

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model($this->ext_folder.$this->extclass.'/' . $this->pname);

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->editField($this->request->get['field_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link($this->ext_folder.$this->extclass.'/' . $this->pname, $this->token_name.'=' . $this->session->data[$this->token_name] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language($this->ext_folder.$this->extclass.'/' . $this->pname);

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model($this->ext_folder.$this->extclass.'/' . $this->pname);

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $field_id) {
                $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->deleteField($field_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link($this->ext_folder.$this->extclass.'/' . $this->pname, $this->token_name.'=' . $this->session->data[$this->token_name] . $url, true));
        }

        $this->response->redirect($this->url->link($this->ext_folder.$this->extclass.'/' . $this->pname, $this->token_name.'=' . $this->session->data[$this->token_name], true));

    }

    protected function getForm() {

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['field_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        
        $data['entry_sort_field'] = $this->language->get('entry_sort_field');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }

        if (isset($this->error['description'])) {
            $data['error_description'] = $this->error['description'];
        } else {
            $data['error_description'] = '';
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', $this->token_name.'=' . $this->session->data[$this->token_name], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link($this->ext_folder.$this->extclass.'/'.$this->pname, $this->token_name.'=' . $this->session->data[$this->token_name] . $url, true)
        );

        if (!isset($this->request->get['field_id'])) {
            $data['action'] = $this->url->link($this->ext_folder.$this->extclass.'/'.$this->pname.'/add', $this->token_name.'=' . $this->session->data[$this->token_name] . $url, true);
        } else {
            $data['action'] = $this->url->link($this->ext_folder.$this->extclass.'/'.$this->pname.'/edit', $this->token_name.'=' . $this->session->data[$this->token_name] . '&field_id=' . $this->request->get['field_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link($this->ext_folder.$this->extclass.'/'.$this->pname, $this->token_name.'=' . $this->session->data[$this->token_name] . $url, true);

        if (isset($this->request->post['art_description'])) {
            $data['art_description'] = $this->request->post['art_description'];
        } elseif (isset($this->request->get['field_id'])) {
            $data['art_description'] = $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->getFieldDescriptions($this->request->get['field_id']);
        } else {
            $data['art_description'] = array();
        }

        $data['version']       = $this->ver;
        $data['version_name']  = $this->vername;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view($this->ext_folder.$this->extclass.'/'.$this->pname.'_form', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', $this->ext_folder.$this->extclass.'/' . $this->pname)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }


        if ((utf8_strlen($this->request->post['art_description']['name']) < 2) || (utf8_strlen($this->request->post['art_description']['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }
        if (utf8_strlen($this->request->post['art_description']['description']) < 2) {
            $this->error['description'] = $this->language->get('error_description');
        }
        

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', $this->ext_folder.$this->extclass.'/' . $this->pname)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function getList($pname, $data, $url) {

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }


        $data['breadcrumbs']   = array();
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link($this->home, $this->token_name.'=' . $this->session->data[$this->token_name], $this->ssl),
            'separator' => false,
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link($this->home_ext, $this->token_name.'=' . $this->session->data[$this->token_name] . $this->home_ext_prefix, $this->ssl),
            'separator' => ' :: ',
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link($this->ext_folder.$this->extclass.'/' . $pname, $this->token_name.'=' . $this->session->data[$this->token_name], $this->ssl),
            'separator' => ' :: ',
        );

        $data['add'] = $this->url->link($this->ext_folder.$this->extclass.'/' . $pname, $this->token_name . '=' . $this->session->data[$this->token_name] . '&res=add' . $url, $this->ssl);
        $data['delete'] = $this->url->link($this->ext_folder.$this->extclass.'/' . $pname . '/delete', $this->token_name . '=' . $this->session->data[$this->token_name] . $url, $this->ssl);

        $data['action'] = $this->url->link($this->ext_folder.$this->extclass.'/' . $pname, $this->token_name.'=' . $this->session->data[$this->token_name], $this->ssl);
        $data['cancel'] = $this->url->link($this->home_ext, $this->token_name.'=' . $this->session->data[$this->token_name] . $this->home_ext_prefix, $this->ssl);

        $data['header']      = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer']      = $this->load->controller('common/footer');

        $data['fields'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $fields_total = $this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->getTotalFields();

        $results = $this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->getFields($filter_data);

        foreach ($results as $result) {
            $data['fields'][] = array(
                'field_id' => $result['field_id'],
                'name'            => $result['name'],
                'sort_field'      => $result['sort_field'],
                'edit'            => $this->url->link($this->ext_folder.$this->extclass.'/' . $pname . '/edit', $this->token_name.'=' . $this->session->data[$this->token_name] . '&field_id=' . $result['field_id'] . $url, true)
            );
        }

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_sort_field'] = $this->language->get('column_sort_field');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link($this->ext_folder.$this->extclass.'/' . $pname, $this->token_name.'=' . $this->session->data[$this->token_name] . '&sort=name' . $url, true);
        $data['sort_sort_field'] = $this->url->link($this->ext_folder.$this->extclass.'/' . $pname, $this->token_name.'=' . $this->session->data[$this->token_name] . '&sort=sort_field' . $url, true);

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $fields_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link($this->ext_folder.$this->extclass.'/' . $pname, $this->token_name.'=' . $this->session->data[$this->token_name] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($fields_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($fields_total - $this->config->get('config_limit_admin'))) ? $fields_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $fields_total, ceil($fields_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $this->response->setOutput($this->load->view($this->ext_folder.$this->extclass.'/'.$this->pname, $data));
    }


    private function validate ($pname) {

        if (!$this->user->hasPermission('modify', $this->ext_folder.$this->extclass.'/' . $pname)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        $pname = $this->pnameplus.$pname;

        $this->load->model($this->ext_folder.$this->extclass.'/'.$this->pname);

        $seterrval = $this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->getErrSettings();

        foreach ($seterrval as $seterrvalpro) {
            if (isset($this->request->post[$pname . '_' . $seterrvalpro])) {
                if (!$this->request->post[$pname . '_' . $seterrvalpro]) {
                    $this->error[$seterrvalpro] = $this->language->get('error_'.$seterrvalpro);
                }
            } else{
                    $this->error[$seterrvalpro] = $this->language->get('error_'.$seterrvalpro);
            }
            
        }

        $seterrLangvar = $this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->getErrLangSettings();

        $this->load->model('localisation/language');

        $languages = $this->model_localisation_language->getLanguages();

        foreach ($languages as $language) {

            foreach ($seterrLangvar as $seterrproLangval) {

                if (!$this->request->post[$pname . '_' . $seterrproLangval . '_' . $language['language_id']]) {
                    $this->error[$seterrproLangval] = $this->language->get('error_'.$seterrproLangval);
                }
            }
        }


        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function install() {

        $this->load->model($this->ext_folder.$this->extclass.'/'.$this->pname);
        $this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->install();
        
        if (!$this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->getEventByCode($this->pname.'_admin_order')){
         
            $code = $this->pname.'_admin_order';
            $trigger = 'admin/view/sale/order_info/before';
            $action = 'extension/module/'.$this->pname.'/admin_order';
            $this->load->model('extension/event');
            $this->model_extension_event->addEvent($code, $trigger, $action);
        }

    }

    public function uninstall() {

        $this->load->model($this->ext_folder.$this->extclass.'/'.$this->pname);
        $this->{'model_'.$this->ext_name.$this->extclass . '_' . $this->pname}->uninstall();
        $this->load->model('extension/event');
        $this->model_extension_event->deleteEvent($this->pname.'_admin_order');

    }

    public function admin_order(&$route, &$args, &$output) {

        if ($this->config->get($this->pnameplus.$this->pname.'_status')) {
            $this->load->model($this->ext_folder.$this->extclass.'/'.$this->pname);

            if (isset($this->request->get['order_id'])) {
                $order_id = $this->request->get['order_id'];
            } else {
                $order_id = 0;
            }

            $this->load->model('sale/order');
            $order_info = $this->model_sale_order->getOrder($order_id);

            $this->load->language($this->ext_folder.$this->extclass.'/' . $this->pname);
            $data['entry_phone'] = $this->language->get('entry_phone');
            $data['entry_user'] = $this->language->get('entry_user');
            $data['entry_message'] = $this->language->get('entry_message');
            $data['entry_field'] = $this->language->get('entry_field');
            $data['text_field_empty'] = $this->language->get('text_field_empty');
            $data['button_msend'] = $this->language->get('button_msend');
            $data['button_newchat'] = $this->language->get('button_newchat');
            $data['button_msendApp'] = $this->language->get('button_msendApp');
            $data['button_msendWeb'] = $this->language->get('button_msendWeb');
            $data['phone'] = $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->getCustomFields($order_info, 'phone', $this->pname);
            $data['store_url'] = $order_info['store_url'];

            $order_info = $this->model_sale_order->getOrder($order_id);
            $data['art_script'] = array();
            $data['mesengers'] = $this->config->get($this->pnameplus.$this->pname.'_messenger');
            $data['order_id'] = $order_info['order_id'];

            foreach ($data['mesengers'] as $messenger) {

                $icon = $messenger;
                $icon_text = '';

                if ($messenger == 'whatsapp') {
                    $icon_text = '';

                }
                else if ($messenger == 'viber') {
                    $icon_text = 'V';

                }
                else if ($messenger == 'telegram') {
                    $icon_text = 'T';
                }
                else if ($messenger == 'skype') {
                    $icon_text = '';
                }

                $data['art_script'][] = array(
                    'title' => $this->language->get('text_button_show'),
                    'messenger' => $messenger,
                    'icon' => $icon,
                    'icon_text' => $icon_text,
                );
            }

            $data['fields'] = $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->getFormNameFields();
            $data['getField'] = str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $this->url->link($this->ext_folder.$this->extclass.'/'.$this->pname.'/getField', $this->token_name.'=' . $this->session->data[$this->token_name], true));
            $data['getRedir'] = str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $this->url->link($this->ext_folder.$this->extclass.'/'.$this->pname.'/getRedir', $this->token_name.'=' . $this->session->data[$this->token_name], true));

            $args['header'] .= $this->load->view($this->ext_folder.$this->extclass.'/'.$this->pname.'_order', $data);

        }

    }

    private function checkUrl ($str) {
        if ($this->config->get($this->pnameplus.$this->pname.'_apikey')) {
            $str = preg_replace_callback('@((https?://)?([-\w]+\.[-\w\.]+)+\w(:\d+)?(/([-\w/_\.]*(\?\S+)?)?)*)@', function ($matches) {
                if (strpos($matches[0], '&') !== false) {
                    return $this->getShortUrl($matches[0]);
                } else {
                    return $matches[0];
                }
            }, $str);
        }
        return $str;
    }

    private function getShortUrl($url) {

        $ch = curl_init( 'https://api.hm.ru/key/url/shorten' );
        $payload = json_encode( array( 'api_key' => $this->config->get($this->pnameplus.$this->pname.'_apikey'), 'url' => $url) );
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $payload );
        curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
        $result = curl_exec($ch);
        curl_close($ch);
        if ($result) {
            $result = json_decode($result, true);
            if ($result && $result['status'] == 1) {
                return $result['data']['short_url'];
            }
            else{
                return $result['message'];
            }
        }
    }

    public function getRedir() {
        //var_dump($this->request->post);
        if (isset($this->request->post['artcmessage-messenger'])) {
            if ($this->request->post['artcmessage-messenger'] == 'whatsapp') {

              $this->response->redirect('whatsapp://send?phone='.$this->request->post['artcmessage_phone-whatsapp'].'&text='.$this->encodeURIComponent($this->checkUrl($this->request->post['artcmessage_message-whatsapp'])));

            }
            else if ($this->request->post['artcmessage-messenger'] == 'viber') {
                $this->response->redirect('viber://forward?number=%2B'.$this->request->post['artcmessage_phone-whatsapp'].'&text='. $this->encodeURIComponent($this->request->post['artcmessage_message-viber']));

            }
            else if ($this->request->post['artcmessage-messenger'] == 'telegram') {
                
            }
            else if ($this->request->post['artcmessage-messenger'] == 'skype') {
                
            }

        }
        else{
            echo 'NO DATA';
            exit();
        }


    }

    private function encodeURIComponent($str) {
        $revert = array('%21'=>'!', '%2A'=>'*', '%27'=>"'", '%28'=>'(', '%29'=>')', '%26quot%3B'=>'"');
        return strtr(urlencode($str), $revert);
    }

    public function getField() {
        $json = false;
        if (isset($this->request->get['field_id'])) {

            if (isset($this->request->get['order_id'])) {
                $order_id = $this->request->get['order_id'];
            } else {
                $order_id = 0;
            }

            $this->load->model('sale/order');
            $order_info = $this->model_sale_order->getOrder($order_id);

            $this->load->model($this->ext_folder.$this->extclass.'/'.$this->pname);
            $json = $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->getCustomFields($order_info, $this->{'model_'.$this->ext_name.$this->extclass.'_'.$this->pname}->getFormDescriptionFields($this->request->get['field_id']), $this->pname);
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json)); 
    }

}
?>