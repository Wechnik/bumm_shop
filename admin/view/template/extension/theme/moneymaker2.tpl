<?php echo $header; ?>
<?php
$moneymaker2_contacts_modes = array(1=>$entry_caption, $entry_image.' + '.$entry_text.' ('.$button_link.')',  $entry_icon.' + '.$entry_text.' ('.$button_link.')', $entry_divider);
$moneymaker2_title_overflow_modes = array(1=>$text_disabled, $entry_common_products_title_overflow_gradient, $entry_common_products_title_overflow_2lines, $entry_common_products_title_overflow_3lines, $entry_common_products_title_overflow_4lines);
$moneymaker2_header_strip_modes_full = array(1=>$entry_in_dropdown, $entry_separate_block.', '.$entry_caption_hidden, $entry_separate_block.', '.$entry_caption." ".$entry_on_screen_xlg, $entry_separate_block.', '.$entry_caption." ".$entry_on_screen_lg, $entry_separate_block.', '.$entry_caption." ".$entry_on_screen_lg_md, $entry_separate_block.', '.$entry_caption." ".$entry_on_screen_lg_md_sm);
$moneymaker2_header_strip_modes = array(1=>$entry_caption_hidden, $entry_on_screen_xlg, $entry_on_screen_lg, $entry_on_screen_lg_md, $entry_on_screen_lg_md_sm);
$moneymaker2_header_modes = array($text_disabled, $entry_header." + ".$entry_title, $entry_title." + ".$entry_header, $entry_header." + ".$entry_text." + ".$entry_title, $entry_title." + ".$entry_text." + ".$entry_header, $entry_title);
$moneymaker2_stickers_sizes = array('lg', '2x', '3x', '4x', '5x');
$moneymaker2_fa_icons  = array(
'-', 'adjust', 'anchor', 'archive', 'area-chart', 'arrows', 'arrows-h', 'arrows-v', 'asterisk', 'at', 'balance-scale', 'ban', 'bar-chart', 'barcode', 'bars', 'battery-empty', 'battery-full', 'battery-half', 'battery-quarter', 'battery-three-quarters', 'bed', 'beer', 'bell', 'bell-o', 'bell-slash', 'bell-slash-o', 'bicycle', 'binoculars', 'birthday-cake', 'bolt', 'bomb', 'book', 'bookmark', 'bookmark-o', 'briefcase', 'bug', 'building', 'building-o', 'bullhorn', 'bullseye', 'bus', 'calculator', 'calendar', 'calendar-check-o', 'calendar-minus-o', 'calendar-o', 'calendar-plus-o', 'calendar-times-o', 'camera', 'camera-retro', 'car', 'caret-square-o-down', 'caret-square-o-left', 'caret-square-o-right', 'caret-square-o-up', 'cart-arrow-down', 'cart-plus', 'cc', 'certificate', 'check', 'check-circle', 'check-circle-o', 'check-square', 'check-square-o', 'child', 'circle', 'circle-o', 'circle-o-notch', 'circle-thin', 'clock-o', 'clone', 'cloud', 'cloud-download', 'cloud-upload', 'code', 'code-fork', 'coffee', 'cog', 'cogs', 'comment', 'comment-o', 'commenting', 'commenting-o', 'comments', 'comments-o', 'compass', 'copyright', 'creative-commons', 'credit-card', 'crop', 'crosshairs', 'cube', 'cubes', 'cutlery', 'database', 'desktop', 'diamond', 'dot-circle-o', 'download', 'ellipsis-h', 'ellipsis-v', 'envelope', 'envelope-o', 'envelope-square', 'eraser', 'exchange', 'exclamation', 'exclamation-circle', 'exclamation-triangle', 'external-link', 'external-link-square', 'eye', 'eye-slash', 'eyedropper', 'fax', 'female', 'fighter-jet', 'file-archive-o', 'file-audio-o', 'file-code-o', 'file-excel-o', 'file-image-o', 'file-pdf-o', 'file-powerpoint-o', 'file-video-o', 'file-word-o', 'film', 'filter', 'fire', 'fire-extinguisher', 'flag', 'flag-checkered', 'flag-o', 'flask', 'folder', 'folder-o', 'folder-open', 'folder-open-o', 'frown-o', 'futbol-o', 'gamepad', 'gavel', 'gift', 'glass', 'globe', 'graduation-cap', 'hand-lizard-o', 'hand-paper-o', 'hand-peace-o', 'hand-pointer-o', 'hand-rock-o', 'hand-scissors-o', 'hand-spock-o', 'hdd-o', 'headphones', 'heart', 'heart-o', 'heartbeat', 'history', 'home', 'hourglass', 'hourglass-end', 'hourglass-half', 'hourglass-o', 'hourglass-start', 'i-cursor', 'inbox', 'industry', 'info', 'info-circle', 'key', 'keyboard-o', 'language', 'laptop', 'leaf', 'lemon-o', 'level-down', 'level-up', 'life-ring', 'lightbulb-o', 'line-chart', 'location-arrow', 'lock', 'magic', 'magnet', 'male', 'map', 'map-marker', 'map-o', 'map-pin', 'map-signs', 'meh-o', 'microphone', 'microphone-slash', 'minus', 'minus-circle', 'minus-square', 'minus-square-o', 'mobile', 'money', 'moon-o', 'motorcycle', 'mouse-pointer', 'music', 'newspaper-o', 'object-group', 'object-ungroup', 'paint-brush', 'paper-plane', 'paper-plane-o', 'paw', 'pencil', 'pencil-square', 'pencil-square-o', 'phone', 'phone-square', 'picture-o', 'pie-chart', 'plane', 'plug', 'plus', 'plus-circle', 'plus-square', 'plus-square-o', 'power-off', 'print', 'puzzle-piece', 'qrcode', 'question', 'question-circle', 'quote-left', 'quote-right', 'random', 'recycle', 'refresh', 'registered', 'reply', 'reply-all', 'retweet', 'road', 'rocket', 'rss', 'rss-square', 'search', 'search-minus', 'search-plus', 'server', 'share', 'share-alt', 'share-alt-square', 'share-square', 'share-square-o', 'shield', 'ship', 'shopping-cart', 'sign-in', 'sign-out', 'signal', 'sitemap', 'sliders', 'smile-o', 'sort', 'sort-alpha-asc', 'sort-alpha-desc', 'sort-amount-asc', 'sort-amount-desc', 'sort-asc', 'sort-desc', 'sort-numeric-asc', 'sort-numeric-desc', 'space-shuttle', 'spinner', 'spoon', 'square', 'square-o', 'star', 'star-half', 'star-half-o', 'star-o', 'sticky-note', 'sticky-note-o', 'street-view', 'suitcase', 'sun-o', 'tablet', 'tachometer', 'tag', 'tags', 'tasks', 'taxi', 'television', 'terminal', 'thumb-tack', 'thumbs-down', 'thumbs-o-down', 'thumbs-o-up', 'thumbs-up', 'ticket', 'times', 'times-circle', 'times-circle-o', 'tint', 'toggle-off', 'toggle-on', 'trademark', 'trash', 'trash-o', 'tree', 'trophy', 'truck', 'tty', 'umbrella', 'university', 'unlock', 'unlock-alt', 'upload', 'user', 'user-plus', 'user-secret', 'user-times', 'users', 'video-camera', 'volume-down', 'volume-off', 'volume-up', 'wheelchair', 'wifi', 'wrench', 'hand-lizard-o', 'hand-o-down', 'hand-o-left', 'hand-o-right', 'hand-o-up', 'hand-paper-o', 'hand-peace-o', 'hand-pointer-o', 'hand-rock-o', 'hand-scissors-o', 'hand-spock-o', 'thumbs-down', 'thumbs-o-down', 'thumbs-o-up', 'thumbs-up', 'ambulance', 'bicycle', 'bus', 'car', 'fighter-jet', 'motorcycle', 'plane', 'rocket', 'ship', 'space-shuttle', 'subway', 'taxi', 'train', 'truck', 'wheelchair', 'genderless', 'mars', 'mars-double', 'mars-stroke', 'mars-stroke-h', 'mars-stroke-v', 'mercury', 'neuter', 'transgender', 'transgender-alt', 'venus', 'venus-double', 'venus-mars', 'file', 'file-archive-o', 'file-audio-o', 'file-code-o', 'file-excel-o', 'file-image-o', 'file-o', 'file-pdf-o', 'file-powerpoint-o', 'file-text', 'file-text-o', 'file-video-o', 'file-word-o', 'circle-o-notch', 'cog', 'refresh', 'spinner', 'check-square', 'check-square-o', 'circle', 'circle-o', 'dot-circle-o', 'minus-square', 'minus-square-o', 'plus-square', 'plus-square-o', 'square', 'square-o', 'cc-amex', 'cc-diners-club', 'cc-discover', 'cc-jcb', 'cc-mastercard', 'cc-paypal', 'cc-stripe', 'cc-visa', 'credit-card', 'google-wallet', 'paypal', 'area-chart', 'bar-chart', 'line-chart', 'pie-chart', 'btc', 'eur', 'gbp', 'gg', 'gg-circle', 'ils', 'inr', 'jpy', 'krw', 'money', 'rub', 'try', 'usd', 'align-center', 'align-justify', 'align-left', 'align-right', 'bold', 'chain-broken', 'clipboard', 'columns', 'eraser', 'file', 'file-o', 'file-text', 'file-text-o', 'files-o', 'floppy-o', 'font', 'header', 'indent', 'italic', 'link', 'list', 'list-alt', 'list-ol', 'list-ul', 'outdent', 'paperclip', 'paragraph', 'repeat', 'scissors', 'strikethrough', 'subscript', 'superscript', 'table', 'text-height', 'text-width', 'th', 'th-large', 'th-list', 'underline', 'undo', 'angle-double-down', 'angle-double-left', 'angle-double-right', 'angle-double-up', 'angle-down', 'angle-left', 'angle-right', 'angle-up', 'arrow-circle-down', 'arrow-circle-left', 'arrow-circle-o-down', 'arrow-circle-o-left', 'arrow-circle-o-right', 'arrow-circle-o-up', 'arrow-circle-right', 'arrow-circle-up', 'arrow-down', 'arrow-left', 'arrow-right', 'arrow-up', 'arrows', 'arrows-alt', 'arrows-h', 'arrows-v', 'caret-down', 'caret-left', 'caret-right', 'caret-square-o-down', 'caret-square-o-left', 'caret-square-o-right', 'caret-square-o-up', 'caret-up', 'chevron-circle-down', 'chevron-circle-left', 'chevron-circle-right', 'chevron-circle-up', 'chevron-down', 'chevron-left', 'chevron-right', 'chevron-up', 'exchange', 'hand-o-down', 'hand-o-left', 'hand-o-right', 'hand-o-up', 'long-arrow-down', 'long-arrow-left', 'long-arrow-right', 'long-arrow-up', 'arrows-alt', 'backward', 'compress', 'eject', 'expand', 'fast-backward', 'fast-forward', 'forward', 'pause', 'play', 'play-circle', 'play-circle-o', 'random', 'step-backward', 'step-forward', 'stop', 'youtube-play', '500px', 'adn', 'amazon', 'android', 'angellist', 'apple', 'behance', 'behance-square', 'bitbucket', 'bitbucket-square', 'black-tie', 'btc', 'buysellads', 'cc-amex', 'cc-diners-club', 'cc-discover', 'cc-jcb', 'cc-mastercard', 'cc-paypal', 'cc-stripe', 'cc-visa', 'chrome', 'codepen', 'connectdevelop', 'contao', 'css3', 'dashcube', 'delicious', 'deviantart', 'digg', 'dribbble', 'dropbox', 'drupal', 'empire', 'expeditedssl', 'facebook', 'facebook-official', 'facebook-square', 'firefox', 'flickr', 'fonticons', 'forumbee', 'foursquare', 'get-pocket', 'gg', 'gg-circle', 'git', 'git-square', 'github', 'github-alt', 'github-square', 'google', 'google-plus', 'google-plus-square', 'google-wallet', 'gratipay', 'hacker-news', 'houzz', 'html5', 'instagram', 'internet-explorer', 'ioxhost', 'joomla', 'jsfiddle', 'lastfm', 'lastfm-square', 'leanpub', 'linkedin', 'linkedin-square', 'linux', 'maxcdn', 'meanpath', 'medium', 'odnoklassniki', 'odnoklassniki-square', 'opencart', 'openid', 'opera', 'optin-monster', 'pagelines', 'paypal', 'pied-piper', 'pied-piper-alt', 'pinterest', 'pinterest-p', 'pinterest-square', 'qq', 'rebel', 'reddit', 'reddit-square', 'renren', 'safari', 'sellsy', 'share-alt', 'share-alt-square', 'shirtsinbulk', 'simplybuilt', 'skyatlas', 'skype', 'slack', 'slideshare', 'soundcloud', 'spotify', 'stack-exchange', 'stack-overflow', 'steam', 'steam-square', 'stumbleupon', 'stumbleupon-circle', 'tencent-weibo', 'trello', 'tripadvisor', 'tumblr', 'tumblr-square', 'twitch', 'twitter', 'twitter-square', 'viacoin', 'vimeo', 'vimeo-square', 'vine', 'vk', 'weibo', 'weixin', 'whatsapp', 'wikipedia-w', 'windows', 'wordpress', 'xing', 'xing-square', 'y-combinator', 'yahoo', 'yelp', 'youtube', 'youtube-play', 'youtube-square', 'ambulance', 'h-square', 'heart', 'heart-o', 'heartbeat', 'hospital-o', 'medkit', 'plus-square', 'stethoscope', 'user-md', 'wheelchair', 'bluetooth', 'bluetooth-b', 'codiepie', 'credit-card-alt', 'edge', 'fort-awesome', 'hashtag', 'mixcloud', 'modx', 'pause-circle', 'pause-circle-o', 'percent', 'product-hunt', 'reddit-alien', 'scribd', 'shopping-bag', 'shopping-basket', 'stop-circle', 'stop-circle-o', 'usb', 'american-sign-language-interpreting', 'asl-interpreting', 'assistive-listening-systems', 'audio-description', 'blind', 'braille', 'deaf', 'deafness', 'envira', 'fa', 'first-order', 'font-awesome', 'gitlab', 'glide', 'glide-g', 'google-plus-circle', 'google-plus-official', 'hard-of-hearing', 'instagram', 'low-vision', 'pied-piper', 'question-circle-o', 'sign-language', 'signing (alias)', 'snapchat', 'snapchat-ghost', 'snapchat-square', 'themeisle', 'universal-access', 'viadeo', 'viadeo-square', 'volume-control-phone', 'wheelchair-alt', 'wpbeginner', 'wpforms', 'yoast', 'address-book', 'address-book-o', 'address-card', 'address-card-o', 'bandcamp', 'bath', 'eercast', 'envelope-open', 'envelope-open-o', 'etsy', 'free-code-camp', 'grav', 'handshake-o', 'id-badge', 'id-card', 'id-card-o', 'imdb', 'linode', 'meetup', 'microchip', 'podcast', 'quora', 'ravelry', 'shower', 'snowflake-o', 'superpowers', 'telegram', 'thermometer-empty', 'thermometer-full', 'thermometer-half', 'thermometer-quarter', 'thermometer-three-quarters', 'user-circle', 'user-circle-o', 'user-o', 'window-close', 'window-close-o', 'window-maximize', 'window-minimize', 'window-restore', 'wpexplorer'
);
$moneymaker2_animation_in_styles = array('bounceIn', 'bounceInDown', 'bounceInLeft', 'bounceInRight', 'bounceInUp', 'fadeIn', 'fadeInDown', 'fadeInDownBig', 'fadeInLeft', 'fadeInLeftBig', 'fadeInRight', 'fadeInRightBig', 'fadeInUp', 'fadeInUpBig', 'flipInX', 'flipInY', 'lightSpeedIn', 'rotateIn', 'rotateInDownLeft', 'rotateInDownRight', 'rotateInUpLeft', 'rotateInUpRight', 'rollIn', 'slideInDown', 'slideInLeft', 'slideInRight', 'slideInUp', 'zoomIn', 'zoomInDown', 'zoomInLeft', 'zoomInRight', 'zoomInUp', 'bounce', 'flash', 'flip', 'hinge', 'pulse', 'rubberBand', 'shake', 'swing', 'tada', 'wobble', 'jello');
$moneymaker2_animation_out_styles = array('bounceOut', 'bounceOutDown', 'bounceOutLeft', 'bounceOutRight', 'bounceOutUp', 'fadeOut', 'fadeOutDown', 'fadeOutDownBig', 'fadeOutLeft', 'fadeOutLeftBig', 'fadeOutRight', 'fadeOutRightBig', 'fadeOutUp', 'fadeOutUpBig', 'flipOutX', 'flipOutY', 'lightSpeedOut', 'rotateOut', 'rotateOutDownLeft', 'rotateOutDownRight', 'rotateOutUpLeft', 'rotateOutUpRight', 'rollOut', 'slideOutDown', 'slideOutLeft', 'slideOutRight', 'slideOutUp', 'zoomOut', 'zoomOutDown', 'zoomOutLeft', 'zoomOutRight', 'zoomOutUp', 'bounce', 'flash', 'flip', 'hinge', 'pulse', 'rubberBand', 'shake', 'swing', 'tada', 'wobble', 'jello');
$moneymaker2_gallery_animation_styles = array('fade', '3d-unfold', 'move-from-top', 'move-horizontal', 'newspaper', 'zoom-in', 'zoom-out', 'slide-bottom');
$moneymaker2_delimiters = array('/',',',':','|','(',')');

// XY, X=bootstrap class symbol (col-sm-X), Y=columns number
$moneymaker2_columns  = array(2=>'62', '43', '34', 'f5', '26', 's7', 'e8');
$moneymaker2_columns_bs  = array('62', '43', '34', '26');
$moneymaker2_banners_styles = array('default','primary', 'success', 'info', 'warning', 'danger');
$moneymaker2_bw_styles  = array('inverse','default');
$moneymaker2_custom_fields  = array('model', 'sku', 'upc', 'ean', 'jan', 'isbn', 'mpn');

$moneymaker2_bg_fixations = array('scroll', 'fixed');
$moneymaker2_bg_positions = array('top left', 'top center', 'top right', 'center left', 'center center', 'center right', 'bottom left', 'bottom center', 'bottom right');
$moneymaker2_bg_repeats = array('repeat', 'no-repeat', 'repeat-x', 'repeat-y');

if(empty($moneymaker2_common_themes_color_primary)) $moneymaker2_common_themes_color_primary                            = "#337ab7";
if(empty($moneymaker2_common_themes_color_darken_15)) $moneymaker2_common_themes_color_darken_15                        = "#286191";
if(empty($moneymaker2_common_themes_color_darken_10)) $moneymaker2_common_themes_color_darken_10                        = "#2C699E";
if(empty($moneymaker2_common_themes_color_darken_5)) $moneymaker2_common_themes_color_darken_5                          = "#2F72AA";
if(empty($moneymaker2_common_themes_color_darken_30)) $moneymaker2_common_themes_color_darken_30                        = "#1E476B";
if(empty($moneymaker2_common_themes_color_darken_17)) $moneymaker2_common_themes_color_darken_17                        = "#275D8C";
if(empty($moneymaker2_common_themes_color_lighten_20)) $moneymaker2_common_themes_color_lighten_20                      = "#67ADEA";
if(empty($moneymaker2_common_themes_color_lighten_17)) $moneymaker2_common_themes_color_lighten_17                      = "#3894E2";
if(empty($moneymaker2_common_themes_color_lighten_25)) $moneymaker2_common_themes_color_lighten_25                      = "#D9E9F7";
if(empty($moneymaker2_common_themes_bg_color)) $moneymaker2_common_themes_bg_color                                      = "#ffffff";
if(empty($moneymaker2_common_themes_bg_fixation)) $moneymaker2_common_themes_bg_fixation                                = "scroll";
if(empty($moneymaker2_common_themes_bg_position)) $moneymaker2_common_themes_bg_position                                = "top left";
if(empty($moneymaker2_common_themes_bg_repeat)) $moneymaker2_common_themes_bg_repeat                                    = "repeat";

if(empty($moneymaker2_common_products_title_overflow)) $moneymaker2_common_products_title_overflow                      = "2";

if(empty($moneymaker2_header_strip_language)) $moneymaker2_header_strip_language                                        = "2";
if(empty($moneymaker2_header_strip_currency)) $moneymaker2_header_strip_currency                                        = "2";
if(empty($moneymaker2_header_strip_search)) $moneymaker2_header_strip_search                                            = "2";
if(empty($moneymaker2_header_strip_menu)) $moneymaker2_header_strip_menu                                                = "2";
if(empty($moneymaker2_header_strip_cart)) $moneymaker2_header_strip_cart                                                = "4";

if(empty($moneymaker2_header_strip_bg_transparency)) $moneymaker2_header_strip_bg_transparency                          = "80";
if(empty($moneymaker2_header_categorystrip_bg_transparency)) $moneymaker2_header_categorystrip_bg_transparency          = "80";
if(empty($moneymaker2_header_alert_bg_color)) $moneymaker2_header_alert_bg_color                                        = "#cccccc";
if(empty($moneymaker2_header_strip_bg_color)) $moneymaker2_header_strip_bg_color                                        = "#111111";
if(empty($moneymaker2_header_strip_font_color[0])) $moneymaker2_header_strip_font_color[0]                              = "#9d9d9d"; //static
if(empty($moneymaker2_header_strip_font_color[1])) $moneymaker2_header_strip_font_color[1]                              = "#ffffff"; //hover
if(empty($moneymaker2_header_strip_font_color[2])) $moneymaker2_header_strip_font_color[2]                              = "#ffffff"; //active
if(empty($moneymaker2_header_strip_sl_font_color[0])) $moneymaker2_header_strip_sl_font_color[0]                        = "#9d9d9d";
if(empty($moneymaker2_header_strip_sl_font_color[1])) $moneymaker2_header_strip_sl_font_color[1]                        = "#ffffff";
if(empty($moneymaker2_header_strip_sl_font_color[2])) $moneymaker2_header_strip_sl_font_color[2]                        = "#ffffff";

if(empty($moneymaker2_header_categorystrip_bg_color)) $moneymaker2_header_categorystrip_bg_color                        = "#666666";
if(empty($moneymaker2_header_categorystrip_font_color[0])) $moneymaker2_header_categorystrip_font_color[0]              = "#777777";
if(empty($moneymaker2_header_categorystrip_font_color[1])) $moneymaker2_header_categorystrip_font_color[1]              = "#333333";
if(empty($moneymaker2_header_categorystrip_font_color[2])) $moneymaker2_header_categorystrip_font_color[2]              = "#555555";
if(empty($moneymaker2_header_categorystrip_sl_font_color[0])) $moneymaker2_header_categorystrip_sl_font_color[0]        = "#eeeeee";
if(empty($moneymaker2_header_categorystrip_sl_font_color[1])) $moneymaker2_header_categorystrip_sl_font_color[1]        = "#ffffff";
if(empty($moneymaker2_header_categorystrip_sl_font_color[2])) $moneymaker2_header_categorystrip_sl_font_color[2]        = "#ffffff";

if(empty($moneymaker2_header_logo_custom_icon)) $moneymaker2_header_logo_custom_icon                                    = "shopping-basket";
if(empty($moneymaker2_header_logo_custom_color1[0])) $moneymaker2_header_logo_custom_color1[0]                          = "#ffffff";
if(empty($moneymaker2_header_logo_custom_color1[1])) $moneymaker2_header_logo_custom_color1[1]                          = "#337ab7";
if(empty($moneymaker2_header_logo_custom_color1[2])) $moneymaker2_header_logo_custom_color1[2]                          = "#337ab7";
if(empty($moneymaker2_header_logo_custom_color2[0])) $moneymaker2_header_logo_custom_color2[0]                          = "#337ab7";
if(empty($moneymaker2_header_logo_custom_color2[1])) $moneymaker2_header_logo_custom_color2[1]                          = "#ffffff";
if(empty($moneymaker2_header_logo_custom_color2[2])) $moneymaker2_header_logo_custom_color2[2]                          = "#ffffff";
if(empty($moneymaker2_header_logo_custom_header_color[0])) $moneymaker2_header_logo_custom_header_color[0]              = "#ffffff";
if(empty($moneymaker2_header_logo_custom_header_color[1])) $moneymaker2_header_logo_custom_header_color[1]              = "#40a7ff";
if(empty($moneymaker2_header_logo_custom_header_color[2])) $moneymaker2_header_logo_custom_header_color[2]              = "#40a7ff";
if(empty($moneymaker2_header_logo_custom_caption_color[0])) $moneymaker2_header_logo_custom_caption_color[0]            = "#cccccc";
if(empty($moneymaker2_header_logo_custom_caption_color[1])) $moneymaker2_header_logo_custom_caption_color[1]            = "#dddddd";
if(empty($moneymaker2_header_logo_custom_caption_color[2])) $moneymaker2_header_logo_custom_caption_color[2]            = "#dddddd";

//if(empty($moneymaker2_header_glowing_color)) $moneymaker2_header_glowing_color                                        = "#ffffff";
if(empty($moneymaker2_header_contacts_phone_highlight_color)) $moneymaker2_header_contacts_phone_highlight_color        = "#ffffff";
if(empty($moneymaker2_header_contacts_icon)) $moneymaker2_header_contacts_icon                                          = "mobile";

if(empty($moneymaker2_header_categories_menu_thumbs_width)) $moneymaker2_header_categories_menu_thumbs_width            = '90';
if(empty($moneymaker2_header_categories_menu_thumbs_height)) $moneymaker2_header_categories_menu_thumbs_height          = '90';
if(empty($moneymaker2_header_categories_menu_columns)) $moneymaker2_header_categories_menu_columns = array();
if(empty($moneymaker2_header_categories_menu_columns['lg'])) $moneymaker2_header_categories_menu_columns['lg']          = 's7';
if(empty($moneymaker2_header_categories_menu_columns['md'])) $moneymaker2_header_categories_menu_columns['md']          = 'f5';
if(empty($moneymaker2_header_categories_menu_columns['sm'])) $moneymaker2_header_categories_menu_columns['sm']          = '34';
if(empty($moneymaker2_header_categories_panel_thumbs_width)) $moneymaker2_header_categories_panel_thumbs_width          = '90';
if(empty($moneymaker2_header_categories_panel_thumbs_height)) $moneymaker2_header_categories_panel_thumbs_height        = '90';
if(empty($moneymaker2_header_categories_panel_columns)) $moneymaker2_header_categories_panel_columns = array();
if(empty($moneymaker2_header_categories_panel_columns['lg'])) $moneymaker2_header_categories_panel_columns['lg']        = 's7';
if(empty($moneymaker2_header_categories_panel_columns['md'])) $moneymaker2_header_categories_panel_columns['md']        = 'f5';
if(empty($moneymaker2_header_categories_panel_columns['sm'])) $moneymaker2_header_categories_panel_columns['sm']        = '34';
if(empty($moneymaker2_header_categories_panel_description_limit)) $moneymaker2_header_categories_panel_description_limit= '110';
if(empty($moneymaker2_header_categories_panel_description_categories)) $moneymaker2_header_categories_panel_description_categories = array();
if(empty($moneymaker2_header_cart_effect_color)) $moneymaker2_header_cart_effect_color                                  = "#FFFFFF";
if(empty($moneymaker2_header_cart_link_icon)) $moneymaker2_header_cart_link_icon                                        = "gift";
if(empty($moneymaker2_header_search_ajax_image_width)) $moneymaker2_header_search_ajax_image_width                      = "35";
if(empty($moneymaker2_header_search_ajax_image_height)) $moneymaker2_header_search_ajax_image_height                    = "35";

if(empty($moneymaker2_catalog_categories_child_images_width)) $moneymaker2_catalog_categories_child_images_width        = "90";
if(empty($moneymaker2_catalog_categories_child_images_height)) $moneymaker2_catalog_categories_child_images_height      = "90";
if(empty($moneymaker2_catalog_home_advantages_icon)) $moneymaker2_catalog_home_advantages_icon                          = 'shopping-basket';
if(empty($moneymaker2_catalog_manufacturer_logo_width)) $moneymaker2_catalog_manufacturer_logo_width                    = "48";
if(empty($moneymaker2_catalog_manufacturer_logo_height)) $moneymaker2_catalog_manufacturer_logo_height                  = "48";
if(empty($moneymaker2_catalog_compare_charts_code_field)) $moneymaker2_catalog_compare_charts_code_field                = "model";
if(empty($moneymaker2_catalog_compare_charts_columns)) $moneymaker2_catalog_compare_charts_columns = array();
if(empty($moneymaker2_catalog_compare_charts_columns['lg'])) $moneymaker2_catalog_compare_charts_columns['lg']          = '43';
if(empty($moneymaker2_catalog_compare_charts_columns['md'])) $moneymaker2_catalog_compare_charts_columns['md']          = '43';
if(empty($moneymaker2_catalog_compare_charts_columns['sm'])) $moneymaker2_catalog_compare_charts_columns['sm']          = '43';
if(empty($moneymaker2_catalog_products_stock_color[0])) $moneymaker2_catalog_products_stock_color[0]                    = "#449d44";
if(empty($moneymaker2_catalog_products_stock_color[1])) $moneymaker2_catalog_products_stock_color[1]                    = "#999999";
if(empty($moneymaker2_catalog_products_code_field)) $moneymaker2_catalog_products_code_field                            = "sku";

if(empty($moneymaker2_product_thumbs_limit)) $moneymaker2_product_thumbs_limit = array();
if(empty($moneymaker2_product_thumbs_limit['xlg'])) $moneymaker2_product_thumbs_limit['xlg']                            = '7';
if(empty($moneymaker2_product_thumbs_limit['lg'])) $moneymaker2_product_thumbs_limit['lg']                              = '5';
if(empty($moneymaker2_product_thumbs_limit['md'])) $moneymaker2_product_thumbs_limit['md']                              = '4';
if(empty($moneymaker2_product_thumbs_limit['sm'])) $moneymaker2_product_thumbs_limit['sm']                              = '6';
if(empty($moneymaker2_product_thumbs_limit['xsm'])) $moneymaker2_product_thumbs_limit['xsm']                            = '6';
if(empty($moneymaker2_product_thumbs_limit['xxsm'])) $moneymaker2_product_thumbs_limit['xxsm']                          = '5';
if(empty($moneymaker2_product_thumbs_limit['xxxsm'])) $moneymaker2_product_thumbs_limit['xxxsm']                        = '3';
if(empty($moneymaker2_product_points_size)) $moneymaker2_product_points_size                                            = 'lg';
foreach ($stock_statuses as $stock_status) {
if(empty($moneymaker2_product_points_stock_color[$stock_status['stock_status_id']])) $moneymaker2_product_points_stock_color[$stock_status['stock_status_id']] = "#aaaaaa";
}
if(empty($moneymaker2_product_points_manufacturer_image_width)) $moneymaker2_product_points_manufacturer_image_width    = '28';
if(empty($moneymaker2_product_points_manufacturer_image_height)) $moneymaker2_product_points_manufacturer_image_height  = '28';
if(empty($moneymaker2_product_options_hide_limit)) $moneymaker2_product_options_hide_limit                              = "2";

if(empty($moneymaker2_footer_strip_bg_color)) $moneymaker2_footer_strip_bg_color                                        = "#777777";
if(empty($moneymaker2_footer_top_bg_color)) $moneymaker2_footer_top_bg_color                                            = "#202020";
if(empty($moneymaker2_footer_bottom_bg_color)) $moneymaker2_footer_bottom_bg_color                                      = "#181818";
if(empty($moneymaker2_footer_links_font_color[0])) $moneymaker2_footer_links_font_color[0]                              = "#aaaaaa"; //static
if(empty($moneymaker2_footer_links_font_color[1])) $moneymaker2_footer_links_font_color[1]                              = "#ffffff"; //hover
if(empty($moneymaker2_footer_links_font_color[2])) $moneymaker2_footer_links_font_color[2]                              = "#ffffff"; //active
if(empty($moneymaker2_footer_text_font_color)) $moneymaker2_footer_text_font_color                                      = "#777777";
if(empty($moneymaker2_footer_text_font_color_h5)) $moneymaker2_footer_text_font_color_h5                                = "#777777";
if(empty($moneymaker2_footer_text_font_color_border)) $moneymaker2_footer_text_font_color_border                        = "#555555";

if(empty($moneymaker2_footer_contacts_icon)) $moneymaker2_footer_contacts_icon                                          = 'phone';
if(empty($moneymaker2_footer_links_icon)) $moneymaker2_footer_links_icon                                                = 'external-link';
if(empty($moneymaker2_footer_text1_icon)) $moneymaker2_footer_text1_icon                                                = 'file-text';
if(empty($moneymaker2_footer_text2_icon)) $moneymaker2_footer_text2_icon                                                = 'file-text';

if(empty($moneymaker2_modules_stickers_transparency)) $moneymaker2_modules_stickers_transparency                        = "70";
if(empty($moneymaker2_modules_stickers_size_catalog)) $moneymaker2_modules_stickers_size_catalog                        = 'lg';
if(empty($moneymaker2_modules_stickers_size_product)) $moneymaker2_modules_stickers_size_product                        = '2x';
if(empty($moneymaker2_modules_stickers_specials_icon)) $moneymaker2_modules_stickers_specials_icon                      = "percent";
if(empty($moneymaker2_modules_stickers_specials_color)) $moneymaker2_modules_stickers_specials_color                    = "#D9534F";
if(empty($moneymaker2_modules_stickers_popular_icon)) $moneymaker2_modules_stickers_popular_icon                        = "thumbs-up";
if(empty($moneymaker2_modules_stickers_popular_color)) $moneymaker2_modules_stickers_popular_color                      = "#337AB7";
if(empty($moneymaker2_modules_stickers_popular_limit)) $moneymaker2_modules_stickers_popular_limit                      = "1000";
if(empty($moneymaker2_modules_stickers_rated_icon)) $moneymaker2_modules_stickers_rated_icon                            = "star";
if(empty($moneymaker2_modules_stickers_rated_color)) $moneymaker2_modules_stickers_rated_color                          = "#F7941D";
if(empty($moneymaker2_modules_stickers_rated_limit)) $moneymaker2_modules_stickers_rated_limit                          = "5";
if(empty($moneymaker2_modules_stickers_new_icon)) $moneymaker2_modules_stickers_new_icon                                = "bolt";
if(empty($moneymaker2_modules_stickers_new_color)) $moneymaker2_modules_stickers_new_color                              = "#5CB85C";
if(empty($moneymaker2_modules_stickers_new_limit)) $moneymaker2_modules_stickers_new_limit                              = "30";
if(empty($moneymaker2_modules_stickers_custom1_icon)) $moneymaker2_modules_stickers_custom1_icon                        = "tag";
if(empty($moneymaker2_modules_stickers_custom1_color)) $moneymaker2_modules_stickers_custom1_color                      = "#999999";
if(empty($moneymaker2_modules_stickers_custom1_field)) $moneymaker2_modules_stickers_custom1_field                      = "upc";
if(empty($moneymaker2_modules_stickers_custom2_icon)) $moneymaker2_modules_stickers_custom2_icon                        = "tags";
if(empty($moneymaker2_modules_stickers_custom2_color)) $moneymaker2_modules_stickers_custom2_color                      = "#BBBBBB";
if(empty($moneymaker2_modules_stickers_custom2_field)) $moneymaker2_modules_stickers_custom2_field                      = "ean";
if(empty($moneymaker2_modules_stickers_promo_icon)) $moneymaker2_modules_stickers_promo_icon                            = "bolt";
if(empty($moneymaker2_modules_promo_style)) $moneymaker2_modules_promo_style                                            = "danger";
if(empty($moneymaker2_modules_quickorder_image_width)) $moneymaker2_modules_quickorder_image_width                      = "228";
if(empty($moneymaker2_modules_quickorder_image_height)) $moneymaker2_modules_quickorder_image_height                    = "228";
if(empty($moneymaker2_modules_quickorder_phone_mask)) $moneymaker2_modules_quickorder_phone_mask                        = "(000) 000-00-00";
if(empty($moneymaker2_modules_callback_thumbs_width)) $moneymaker2_modules_callback_thumbs_width                        = "228";
if(empty($moneymaker2_modules_callback_thumbs_height)) $moneymaker2_modules_callback_thumbs_height                      = "228";
if(empty($moneymaker2_modules_newsletter_thumbs_width)) $moneymaker2_modules_newsletter_thumbs_width                    = "228";
if(empty($moneymaker2_modules_newsletter_thumbs_height)) $moneymaker2_modules_newsletter_thumbs_height                  = "228";
if(empty($moneymaker2_modules_popup_limit)) $moneymaker2_modules_popup_limit                                            = "30";
if(empty($moneymaker2_modules_popup_delay)) $moneymaker2_modules_popup_delay                                            = "10";
?>

<style type="text/css">
#vtab-header_contacts .img-thumbnail img {
	max-width: 25px;
}
.form-control {
	padding: 8px;
}
fieldset {
	padding-bottom: 45px;
}
fieldset.successively {
	padding-bottom: 5px;
}
fieldset.successively legend small.text-muted {
	font-size: 80%;
}
.form-group {
	padding-bottom: 22px;
}
.form-group .input-group .panel {
	margin-bottom: 0;
}
.form-group .well.well-sm {
	height: 215px;
	overflow: auto;
}
.form-group p.text-center {
	margin-top: -1px;

	font-size: 11px;
	color: #777;
}
@media (min-width: 768px) {
	.form-group p.text-center {
		margin-bottom: -15px;
	}
}
.form-group .alert {
	margin-bottom: 0px;
}
.margintop {
	margin-top: 30px;
}
.margin-top {
	margin-top: -20px;
}
.paddingtop {
	padding-top: 9px;
}
.strong {
	font-weight: bold;
}
.btn.btn-success.form-control {
	text-align: left;
}
.colorpicker {
	color: #fff;
	font-size: 10px;
	text-align: center;
	text-transform: uppercase;
	text-shadow: 0px 0px 6px #000;
}
.colpick { margin-top: -205px !important; z-index: 9999; }
#animationSandbox {
	font-size: 42px;
	padding: 80px 0;
	margin: 35px 0;
	border: 1px solid #ccc;
	background-color: #fff;
}
.form-control.colorpicker  {
	cursor: pointer;
}
.modal-body .btn.btn-block.btn-default, #moneymaker2_categories .btn.btn-block.btn-default  {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: left;
	margin-bottom: 2px;
}
.checkbox .btn-sm {
	padding: 2px 3px;
	font-size: 8px;
	line-height: 1.2;
}
.radio label, .checkbox label {
	padding-left: 10px;
}
.lowercase {
	text-transform: lowercase;
}
.slider .tooltip {
	z-index: 10;
}
.container-fluid > div.pull-right {
	margin-right: 10px;
}
.container-fluid > div.pull-right.sticky {
	position: fixed;
	right: 20px;
	top: 8px;
	z-index: 3;
	background-color: #fff;
}
</style>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right hidden">
				<a onclick="apply()" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-primary<?php if (!$moneymaker2_permission) { ?> disabled<?php } ?>"><span><i class="fa fa-save"></i> &nbsp;<?php echo $button_apply; ?></span></a><script language="javascript">function apply(){$('#form-theme-moneymaker2').append('<input type="hidden" id="apply" name="apply" value="1"  />'); resetCategoriesIcons(); resetInformationsIcons(); $('#form-theme-moneymaker2').submit();}</script>
				<button type="submit" form="form-theme-moneymaker2" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary hidden"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" form="form-backup" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?> (<?php echo $moneymaker2_store_name; ?>)</h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-theme-moneymaker2" class="form-horizontal">

					<div class="tab-pane">
						<ul class="nav nav-tabs" id="tabs">
							<li><a href="#tab_common" data-toggle="tab"><?php echo $entry_tab_common; ?></a></li>
							<li><a href="#tab_header" data-toggle="tab"><?php echo $entry_tab_header; ?></a></li>
							<li><a href="#tab_catalog" data-toggle="tab"><?php echo $entry_tab_catalog; ?></a></li>
							<li><a href="#tab_product" data-toggle="tab"><?php echo $entry_tab_product; ?></a></li>
							<li><a href="#tab_footer" data-toggle="tab"><?php echo $entry_tab_footer; ?></a></li>
							<li><a href="#tab_modules" data-toggle="tab"><?php echo $entry_tab_modules; ?></a></li>
							<li><a href="#tab_help" data-toggle="tab"><?php echo $entry_tab_help; ?></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="tab_common">
								<fieldset>
									<legend><?php echo $entry_tab_common; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_tab_common_help; ?><br /></p>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_status" id="input-status" class="form-control">
												<?php if ($moneymaker2_status) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>

									<p class="form-group"><br /></p>

									<div class="form-group">
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_sidebars_responsive_help; ?>"><?php echo $entry_sidebars; ?></span></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_sidebars_responsive" class="form-control">
												<?php if ($moneymaker2_common_sidebars_responsive) { ?>
												<option value="1" selected="selected"><?php echo $entry_responsive; ?></option>
												<option value="0"><?php echo $entry_standart; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $entry_responsive; ?></option>
												<option value="0" selected="selected"><?php echo $entry_standart; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_buy; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_buy_hide" class="form-control">
												<?php if ($moneymaker2_common_buy_hide) { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_cart_outofstock_disabled_help; ?>"><?php echo $entry_common_cart_outofstock_disabled; ?></span></label>
										<div class="col-sm-4">
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_cart_outofstock_disabled" value="1" <?php if ($moneymaker2_common_cart_outofstock_disabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_cart_outofstock_disabled" value="0" <?php if (!$moneymaker2_common_cart_outofstock_disabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_price_detached_help; ?>"><?php echo $entry_common_price_detached; ?></span></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_price_detached" class="form-control">
												<?php if ($moneymaker2_common_price_detached) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_dropdown_hover; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_dropdown_hover" class="form-control">
												<?php if ($moneymaker2_common_dropdown_hover) { ?>
												<option value="1" selected="selected"><?php echo $entry_hover; ?></option>
												<option value="0"><?php echo $entry_click; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $entry_hover; ?></option>
												<option value="0" selected="selected"><?php echo $entry_click; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_wishlist; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_wishlist_hide" class="form-control">
												<?php if ($moneymaker2_common_wishlist_hide) { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
										<label class="col-sm-2 control-label"><?php echo $entry_display_caption; ?></label>
										<div class="col-sm-4">
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_wishlist_caption" value="1" <?php if ($moneymaker2_common_wishlist_caption) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_wishlist_caption" value="0" <?php if (!$moneymaker2_common_wishlist_caption) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_compare; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_compare_hide" class="form-control">
												<?php if ($moneymaker2_common_compare_hide) { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
										<label class="col-sm-2 control-label"><?php echo $entry_display_caption; ?></label>
										<div class="col-sm-4">
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_compare_caption" value="1" <?php if ($moneymaker2_common_compare_caption) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_compare_caption" value="0" <?php if (!$moneymaker2_common_compare_caption) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_browser_warned_help; ?>"><?php echo $entry_common_browser_warned; ?></span></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_browser_warned" class="form-control">
												<?php if ($moneymaker2_common_browser_warned) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_minify_help; ?>"><?php echo $entry_common_minify; ?></span></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_minify" class="form-control">
												<?php if ($moneymaker2_common_minify) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_scrolltop; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_scrolltop" class="form-control">
												<?php if ($moneymaker2_common_scrolltop) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
										<label class="col-sm-2 control-label"><?php echo $entry_display_caption; ?></label>
										<div class="col-sm-4">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
												<input type="text" placeholder="<?php echo $entry_optional; ?>" name="moneymaker2_common_scrolltop_text[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_common_scrolltop_text[$language['language_id']]) ? $moneymaker2_common_scrolltop_text[$language['language_id']] : ''; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_agree_warning; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_common_agree_warning" class="form-control">
												<option value="0"><?php echo $text_disabled ?></option>
												<?php foreach ($informations as $information) { ?>
												<option value="<?php echo $information['information_id']; ?>" <?php if ($information['information_id'] == $moneymaker2_common_agree_warning) { ?>selected="selected"<?php } ?>><?php echo $information['title'] ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<legend><?php echo $entry_custom_css; ?></legend>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
										<div class="col-sm-9">
											<input type="hidden" name="moneymaker2_date" value="<?php echo date('ymdHis'); ?>" />
											<?php $filename = '../catalog/view/theme/moneymaker2/stylesheet/stylesheet.custom.store'.$moneymaker2_store_id.'.css';
											$moneymaker2_styles = "@media(min-width:768px){ ";
											if ($moneymaker2_header_strip_fixed&&!$moneymaker2_header_categories_panel_fixed) {
											$moneymaker2_styles.= "body {padding-top: 55px;}";
											} else if ($moneymaker2_header_strip_fixed&&$moneymaker2_header_categories_panel_fixed) {
												$moneymaker2_styles.= "header > .categories-menu.navbar-default {top: 55px;}";
												if ($moneymaker2_header_categories_panel) {
													$moneymaker2_styles.= "html {padding-top: 110px;}";
												} else {
													$moneymaker2_styles.= "html {padding-top: 55px;}";
												}
											}
											$moneymaker2_styles.= "#top.navbar-default .navbar-nav>li>a {color: ".$moneymaker2_header_strip_font_color[0].";}";
											$moneymaker2_styles.= "#top.navbar-default .navbar-nav>li>a:focus, #top.navbar-default .navbar-nav>li>a:hover {color: ".$moneymaker2_header_strip_font_color[1].";}";
											$moneymaker2_styles.= "#top.navbar-default .navbar-nav>.open>a, #top.navbar-default .navbar-nav>.open>a:focus, #top.navbar-default .navbar-nav>.open>a:hover {color: ".$moneymaker2_header_strip_font_color[2].";}";
											$moneymaker2_styles.= "#cart > a > small.fa-stack {color: ".$moneymaker2_header_strip_font_color[2].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen #top.navbar-default .navbar-nav>li>a {color: ".$moneymaker2_header_strip_sl_font_color[0].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen #top.navbar-default .navbar-nav>li>a:focus, .owl-moneymaker2-fullscreen #top.navbar-default .navbar-nav>li>a:hover {color: ".$moneymaker2_header_strip_sl_font_color[1].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen #top.navbar-default .navbar-nav>.open>a, .owl-moneymaker2-fullscreen #top.navbar-default .navbar-nav>.open>a:focus, .owl-moneymaker2-fullscreen #top.navbar-default .navbar-nav>.open>a:hover {color: ".$moneymaker2_header_strip_sl_font_color[2].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen #cart > a > small.fa-stack {color: ".$moneymaker2_header_strip_sl_font_color[2].";}";

											list($moneymaker2_r, $moneymaker2_g, $moneymaker2_b) = sscanf($moneymaker2_header_strip_bg_color, "#%02x%02x%02x");
											$moneymaker2_styles.= "#top.navbar-default {background-color: rgb(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.");background-color: rgba(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.", ".($moneymaker2_header_strip_bg_transparency/100).");}";
											$moneymaker2_styles.= "#cart > a > small.fa-stack > span.fa-stack-1x {color: rgba(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.", ".($moneymaker2_header_strip_bg_transparency/100).");}";

											list($moneymaker2_r, $moneymaker2_g, $moneymaker2_b) = sscanf($moneymaker2_header_categorystrip_bg_color, "#%02x%02x%02x");
											$moneymaker2_styles.= ".categories-menu.navbar-default {background-color: rgb(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.");background-color: rgba(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.", ".($moneymaker2_header_categorystrip_bg_transparency/100).");}";

											$moneymaker2_styles.= ".categories-menu.navbar-default .navbar-nav>li>a {color: ".$moneymaker2_header_categorystrip_font_color[0].";}";
											$moneymaker2_styles.= ".categories-menu.navbar-default .navbar-nav>li>a:focus, .categories-menu.navbar-default .navbar-nav>li>a:hover {color: ".$moneymaker2_header_categorystrip_font_color[1].";}";
											$moneymaker2_styles.= ".categories-menu.navbar-default .navbar-nav>.open>a, .categories-menu.navbar-default .navbar-nav>.open>a:focus, .categories-menu.navbar-default .navbar-nav>.open>a:hover {color: ".$moneymaker2_header_categorystrip_font_color[2].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen .categories-menu.navbar-default .navbar-nav>li>a {color: ".$moneymaker2_header_categorystrip_sl_font_color[0].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen .categories-menu.navbar-default .navbar-nav>li>a:focus, .owl-moneymaker2-fullscreen .categories-menu.navbar-default .navbar-nav>li>a:hover {color: ".$moneymaker2_header_categorystrip_sl_font_color[1].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen .categories-menu.navbar-default .navbar-nav>.open>a, .owl-moneymaker2-fullscreen .categories-menu.navbar-default .navbar-nav>.open>a:focus, .owl-moneymaker2-fullscreen .categories-menu.navbar-default .navbar-nav>.open>a:hover {color: ".$moneymaker2_header_categorystrip_sl_font_color[2].";}";

											if ($moneymaker2_header_contacts_phone_highlight) {
											$moneymaker2_styles.= "#contacts span.phone {color: ".$moneymaker2_header_contacts_phone_highlight_color.";}";
											}
											if ($moneymaker2_header_cart_effect) {
											$moneymaker2_styles.= "@-moz-keyframes cart-effect-blink { 50% { color: ".$moneymaker2_header_cart_effect_color."; text-shadow: 0 0 20px ".$moneymaker2_header_cart_effect_color."; } }";
											$moneymaker2_styles.= "@-webkit-keyframes cart-effect-blink { 50% { color: ".$moneymaker2_header_cart_effect_color."; text-shadow: 0 0 20px ".$moneymaker2_header_cart_effect_color."; } }";
											$moneymaker2_styles.= "@keyframes cart-effect-blink { 50% { color: ".$moneymaker2_header_cart_effect_color."; text-shadow: 0 0 20px ".$moneymaker2_header_cart_effect_color."; } }";
											}
											$moneymaker2_styles.= "}/*@media*/";
											if (!$moneymaker2_product_gallery_thumbs_round) {
											$moneymaker2_styles.= ".image-additional .owl-moneymaker2 .owl-item img { border-radius: 2px; }";
											}
											$moneymaker2_styles.= ".navbar-header > a {color: ".$moneymaker2_header_strip_font_color[0].";}";
											$moneymaker2_styles.= ".navbar-header > a:hover {color: ".$moneymaker2_header_strip_font_color[1].";}";
											$moneymaker2_styles.= ".navbar-header > a:focus {color: ".$moneymaker2_header_strip_font_color[2].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen .navbar-header > a {color: ".$moneymaker2_header_strip_sl_font_color[0].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen .navbar-header > a:hover {color: ".$moneymaker2_header_strip_sl_font_color[1].";}";
											$moneymaker2_styles.= ".owl-moneymaker2-fullscreen .navbar-header > a:focus {color: ".$moneymaker2_header_strip_sl_font_color[2].";}";
											$moneymaker2_styles.= "@media(max-width:767px){ ";
											list($moneymaker2_r, $moneymaker2_g, $moneymaker2_b) = sscanf($moneymaker2_header_strip_bg_color, "#%02x%02x%02x");
											$moneymaker2_styles.= "#top .navbar-header {background-color: rgb(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.");background-color: rgba(".$moneymaker2_r.", ".$moneymaker2_g.", ".$moneymaker2_b.", ".($moneymaker2_header_strip_bg_transparency/100).");}";

											if (!$moneymaker2_header_categories_panel) {
											$moneymaker2_styles.= "body.owl-moneymaker2-fullscreen header > #top.navbar-default { margin-bottom: 0;}";
											}
											$moneymaker2_styles.= "}/*@media*/";
											if ($moneymaker2_header_logo_custom) {
											$moneymaker2_styles.= "#logo > a {text-decoration: none;}";
											$moneymaker2_styles.= "#logo .fa-stack .fa-stack-1x {color: ".$moneymaker2_header_logo_custom_color1[0].";}";
											$moneymaker2_styles.= "#logo .fa-stack .fa-stack-2x {color: ".$moneymaker2_header_logo_custom_color2[0].";}";
											$moneymaker2_styles.= "#logo .text-primary {color: ".$moneymaker2_header_logo_custom_header_color[0].";}";
											$moneymaker2_styles.= "#logo small {color: ".$moneymaker2_header_logo_custom_caption_color[0].";}";
											$moneymaker2_styles.= "#logo>a:hover .fa-stack .fa-stack-1x {color: ".$moneymaker2_header_logo_custom_color1[1].";}";
											$moneymaker2_styles.= "#logo>a:hover .fa-stack .fa-stack-2x {color: ".$moneymaker2_header_logo_custom_color2[1].";}";
											$moneymaker2_styles.= "#logo>a:hover .text-primary {color: ".$moneymaker2_header_logo_custom_header_color[1].";}";
											$moneymaker2_styles.= "#logo>a:hover small {color: ".$moneymaker2_header_logo_custom_caption_color[1].";}";
											$moneymaker2_styles.= "#logo>a:focus .fa-stack .fa-stack-1x {color: ".$moneymaker2_header_logo_custom_color1[2].";}";
											$moneymaker2_styles.= "#logo>a:focus .fa-stack .fa-stack-2x {color: ".$moneymaker2_header_logo_custom_color2[2].";}";
											$moneymaker2_styles.= "#logo>a:focus .text-primary {color: ".$moneymaker2_header_logo_custom_header_color[2].";}";
											$moneymaker2_styles.= "#logo>a:focus small {color: ".$moneymaker2_header_logo_custom_caption_color[2].";}";
											}
											if ($moneymaker2_header_strip_expanded) {
											$moneymaker2_styles.= "#top .navbar-collapse.collapse { display: block!important; }";
											}
											if ($moneymaker2_header_strip_expanded&&$moneymaker2_header_categories_panel_expanded) {
											$moneymaker2_styles.= ".categories-menu .navbar-collapse.collapse { display: block!important; }";
											}
											if ($moneymaker2_header_search_moved) {
											$moneymaker2_styles.= "#search.dropdown { display: none; }";
											}
											$moneymaker2_styles_modules_stickers_background = $moneymaker2_modules_stickers_background ? "255, 255, 255" : "0, 0, 0";
											$moneymaker2_styles.= ".sticker > .tooltip.right .tooltip-inner {background-color: rgba(".$moneymaker2_styles_modules_stickers_background.", 0.".$moneymaker2_modules_stickers_transparency.");}";
											$moneymaker2_styles.= ".sticker > .tooltip.right .tooltip-arrow {border-right-color: rgba(".$moneymaker2_styles_modules_stickers_background.", 0.".$moneymaker2_modules_stickers_transparency.");}";
											$moneymaker2_styles.= ".sticker.sticker-special {color: ".$moneymaker2_modules_stickers_specials_color.";}";
											$moneymaker2_styles.= ".sticker.sticker-popular {color: ".$moneymaker2_modules_stickers_popular_color.";}";
											$moneymaker2_styles.= ".sticker.sticker-rated {color: ".$moneymaker2_modules_stickers_rated_color.";}";
											$moneymaker2_styles.= ".sticker.sticker-new {color: ".$moneymaker2_modules_stickers_new_color.";}";
											$moneymaker2_styles.= ".sticker.sticker-custom1 {color: ".$moneymaker2_modules_stickers_custom1_color.";}";
											$moneymaker2_styles.= ".sticker.sticker-custom2 {color: ".$moneymaker2_modules_stickers_custom2_color.";}";
											if ($moneymaker2_modules_stickers_background) {
											$moneymaker2_styles.= ".sticker > .tooltip.right > .tooltip-inner {color: #111;}";
											}
											if ($moneymaker2_common_themes_bg_mode) {
												if ($moneymaker2_common_themes_image_src) {
													$moneymaker2_styles.= "body {background: ".$moneymaker2_common_themes_bg_fixation." ".$moneymaker2_common_themes_bg_position." ".$moneymaker2_common_themes_bg_repeat." url('../../../../../image/".$moneymaker2_common_themes_image_src."');}";
												} else {
													$moneymaker2_styles.= "body {background: url('".$moneymaker2_common_themes_thumb."');}";
												}
											} else {
												$moneymaker2_common_themes_bg_color_rgb = sscanf($moneymaker2_common_themes_bg_color, "#%02x%02x%02x");
												$moneymaker2_styles.= "body {background-color: ".$moneymaker2_common_themes_bg_color.";}";
												$moneymaker2_styles.= ".fa-stack.img-thumbnail {background-color: ".$moneymaker2_common_themes_bg_color.";}";
												$moneymaker2_styles.= "div.hr:after {border-color: ".$moneymaker2_common_themes_bg_color." transparent;}";
												$moneymaker2_styles.= ".advantage-caret-right:after {border-left: 10px solid ".$moneymaker2_common_themes_bg_color.";}";
												$moneymaker2_styles.= ".advantage-caret-left:after {border-right: 10px solid ".$moneymaker2_common_themes_bg_color.";}";
												$moneymaker2_styles.= ".owl-moneymaker2.owl-moneymaker2-products .owl-buttons .owl-prev, #column-left .owl-moneymaker2 .owl-buttons .owl-prev,#column-right .owl-moneymaker2 .owl-buttons .owl-prev {background: linear-gradient(to left, rgba(".$moneymaker2_common_themes_bg_color_rgb[0].",".$moneymaker2_common_themes_bg_color_rgb[1].",".$moneymaker2_common_themes_bg_color_rgb[2].", 0.0), rgba(".$moneymaker2_common_themes_bg_color_rgb[0].",".$moneymaker2_common_themes_bg_color_rgb[1].",".$moneymaker2_common_themes_bg_color_rgb[2].", 1));}";
												$moneymaker2_styles.= ".owl-moneymaker2.owl-moneymaker2-products .owl-buttons .owl-next, #column-left .owl-moneymaker2 .owl-buttons .owl-next, #column-right .owl-moneymaker2 .owl-buttons .owl-next {background: linear-gradient(to right, rgba(".$moneymaker2_common_themes_bg_color_rgb[0].",".$moneymaker2_common_themes_bg_color_rgb[1].",".$moneymaker2_common_themes_bg_color_rgb[2].", 0.0), rgba(".$moneymaker2_common_themes_bg_color_rgb[0].",".$moneymaker2_common_themes_bg_color_rgb[1].",".$moneymaker2_common_themes_bg_color_rgb[2].", 1));}";
											}

											if ($moneymaker2_catalog_products_list_stock_hide) {
											$moneymaker2_styles.= ".products .product-list .product-thumb .additional .stock {display: none;}";
											}
											if ($moneymaker2_catalog_products_grid_stock_hide) {
											$moneymaker2_styles.= ".products .product-grid .product-thumb .additional .stock {display: none;}";
											}
											if ($moneymaker2_catalog_products_list_code_hide) {
											$moneymaker2_styles.= ".products .product-list .product-thumb .additional .code {display: none;}";
											}
											if ($moneymaker2_catalog_products_grid_code_hide) {
											$moneymaker2_styles.= ".products .product-grid .product-thumb .additional .code {display: none;}";
											}
											if (!$moneymaker2_catalog_products_list_description) {
											$moneymaker2_styles.= ".products .product-list .product-thumb .description {display: none;}";
											}
											if (!$moneymaker2_catalog_products_grid_description) {
											$moneymaker2_styles.= ".products .product-grid .product-thumb .description {display: none;}";
											}
											$moneymaker2_styles.= ".product-thumb .additional .stock.instock {border-color: ".$moneymaker2_catalog_products_stock_color[0].";color: ".$moneymaker2_catalog_products_stock_color[0].";}";
											$moneymaker2_styles.= ".product-thumb .additional .stock {border-color: ".$moneymaker2_catalog_products_stock_color[1].";color: ".$moneymaker2_catalog_products_stock_color[1].";}";
											if ($moneymaker2_common_products_title_overflow==2&&$moneymaker2_common_themes_bg_mode) {
											$moneymaker2_styles.= "#content .product-thumb .caption {white-space: nowrap; overflow: hidden;}#content .product-thumb .caption > a::after, #content .product-thumb .caption > span::after {content: '';position: absolute;right: 15px;width: 80px;height: 22px;}";
											} else if ($moneymaker2_common_products_title_overflow==2) {
											$moneymaker2_common_themes_bg_color_rgb = sscanf($moneymaker2_common_themes_bg_color, "#%02x%02x%02x");
											$moneymaker2_styles.= "#content .product-thumb .caption {white-space: nowrap; overflow: hidden;}#content .product-thumb .caption > a::after, #content .product-thumb .caption > span::after {content: '';position: absolute;right: 15px;width: 80px;height: 22px;background: linear-gradient(to right, rgba(".$moneymaker2_common_themes_bg_color_rgb[0].",".$moneymaker2_common_themes_bg_color_rgb[1].",".$moneymaker2_common_themes_bg_color_rgb[2].", 0.1), rgba(".$moneymaker2_common_themes_bg_color_rgb[0].",".$moneymaker2_common_themes_bg_color_rgb[1].",".$moneymaker2_common_themes_bg_color_rgb[2].", 1));}";
											} else if ($moneymaker2_common_products_title_overflow==3) {
											$moneymaker2_styles.= "#content .product-grid .product-thumb .caption {min-height: 53px;}";
											} else if ($moneymaker2_common_products_title_overflow==4) {
											$moneymaker2_styles.= "#content .product-grid .product-thumb .caption {min-height: 73px;}";
											} else if ($moneymaker2_common_products_title_overflow==5) {
											$moneymaker2_styles.= "#content .product-grid .product-thumb .caption {min-height: 93px;}";
											}

											foreach ($stock_statuses as $stock_status) {
											$moneymaker2_styles.= ".product-points .stock-".$stock_status['stock_status_id']." .fa-stack { color: ".$moneymaker2_product_points_stock_color[$stock_status['stock_status_id']]." ; } ";
											}

											$moneymaker2_styles.= " header #top.navbar-default {border-bottom: 2px solid ".$moneymaker2_footer_strip_bg_color."}  footer {background-color: ".$moneymaker2_footer_top_bg_color."; border-top: 2px solid ".$moneymaker2_footer_strip_bg_color."; color: ".$moneymaker2_footer_text_font_color.";}";
											$moneymaker2_styles.= "footer .col-sm-3 > ul .input-group > input {color: ".$moneymaker2_footer_text_font_color.";}";
											$moneymaker2_styles.= "footer .bottom .col-sm-3 {color: ".$moneymaker2_footer_text_font_color.";}";
											$moneymaker2_styles.= "footer .bottom {background-color: ".$moneymaker2_footer_bottom_bg_color.";}";
											$moneymaker2_styles.= "footer a, footer .bottom .col-sm-9 .fa-stack .fa-inverse {color: ".$moneymaker2_footer_links_font_color[0].";}";
											$moneymaker2_styles.= "footer a:hover {color: ".$moneymaker2_footer_links_font_color[1].";}";
											$moneymaker2_styles.= "footer a:focus {color: ".$moneymaker2_footer_links_font_color[2].";}";
											$moneymaker2_styles.= "footer .h5.text-muted {color: ".$moneymaker2_footer_text_font_color_h5.";}";
											$moneymaker2_styles.= "footer .h5, footer .bottom .col-sm-9 .fa-stack {border-color: ".$moneymaker2_footer_text_font_color_border.";}";

											if ($moneymaker2_common_sidebars_responsive) {
											$moneymaker2_styles.= "@media screen and (max-width: 767px) {body, html {overflow-x: hidden;} body > .container > .row {position: relative;} #column-left {left: -72%;margin-left: 15px;} #column-right {right: -72%;margin-right: 15px;} #column-left, #column-right {position: absolute;top: 0;width: 72%;} }";
											}
											if ($moneymaker2_catalog_advantages_small) {
											$moneymaker2_styles.= ".catalog-advantage > span.text-left, .catalog-advantage > span.text-right {font-size:85%}";
											}
											if (isset($moneymaker2_catalog_categories_advantages_enabled)&&$moneymaker2_catalog_categories_advantages_enabled&&!$moneymaker2_catalog_categories_images_hide&&!$moneymaker2_common_categories_icons_enabled) {
											$moneymaker2_styles.= "@media (min-width: 1200px) { ";
											$moneymaker2_styles.= "#content.col-sm-12 .catalog-advantage {width: ".((1126-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "#content.col-sm-9 .catalog-advantage {width: ".((834-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "#content.col-sm-6 .catalog-advantage {width: ".((541-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "}";
											$moneymaker2_styles.= "@media (min-width: 992px) and (max-width: 1199px) { ";
											$moneymaker2_styles.= "#content.col-sm-12 .catalog-advantage {width: ".((926-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "#content.col-sm-9 .catalog-advantage {width: ".((682-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "#content.col-sm-6 .catalog-advantage {width: ".((441-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "}";
											$moneymaker2_styles.= "@media (min-width: 768px) and (max-width: 991px) { ";
											$moneymaker2_styles.= "#content.col-sm-12 .catalog-advantage {width: ".((706-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "#content.col-sm-9 .catalog-advantage {width: ".((519-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "#content.col-sm-6 .catalog-advantage {width: ".((331-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "}";
											$moneymaker2_styles.= "@media (min-width: 561px) and (max-width: 767px) { ";
											$moneymaker2_styles.= "#content .catalog-advantage {width: ".((498-$moneymaker2_image_category_width)/2)."px;}";
											$moneymaker2_styles.= "}";
											} else if (isset($moneymaker2_catalog_categories_advantages_enabled)&&$moneymaker2_catalog_categories_advantages_enabled&&$moneymaker2_catalog_categories_images_hide&&$moneymaker2_common_categories_icons_enabled) {
											$moneymaker2_styles.= "@media (min-width: 1200px) {#content.col-sm-12 .catalog-advantage {width: 510px;}#content.col-sm-9 .catalog-advantage {width: 350px;}#content.col-sm-6 .catalog-advantage {width: 230px;}}";
											$moneymaker2_styles.= "@media (min-width: 992px) and (max-width: 1199px) {#content.col-sm-12 .catalog-advantage {width: 420px;}#content.col-sm-9 .catalog-advantage {width: 300px;}#content.col-sm-6 .catalog-advantage {width: 190px;}}";
											$moneymaker2_styles.= "@media (min-width: 768px) and (max-width: 991px) {#content.col-sm-12 .catalog-advantage {width: 310px;}#content.col-sm-9 .catalog-advantage {width: 220px;}#content.col-sm-6 .catalog-advantage {width: 135px;}}";
											$moneymaker2_styles.= "@media (min-width: 561px) and (max-width: 767px) {#content .catalog-advantage {width: 220px;}}";
											}
											if (isset($moneymaker2_header_alert_bg_color)&&$moneymaker2_header_alert_bg_color) {
											$moneymaker2_styles.= "body > .header-alert {background-color: ".$moneymaker2_header_alert_bg_color.";}";
											}
											$moneymaker2_styles.= ($moneymaker2_common_css_enabled&&isset($moneymaker2_common_css)) ? $moneymaker2_common_css : '';
											$styles = html_entity_decode($moneymaker2_styles, ENT_QUOTES, 'UTF-8');

											if ($moneymaker2_permission&&fopen($filename, 'w')&&is_writable($filename)) {
											if ($styles) {
											if (!$handle = fopen($filename, 'w')) { echo '<div class="alert alert-danger">'.sprintf($entry_file_not_opened, substr($filename,strrpos($filename, "/")+1)).'</div>'; exit; }
											if (fwrite($handle, $styles) === FALSE) { echo '<div class="alert alert-danger">'.sprintf($entry_file_not_writable, substr($filename,strrpos($filename, "/")+1)).'</div>'; exit; }
											echo '<div class="alert alert-info">'.sprintf($entry_file_updated, substr($filename,strrpos($filename, "/")+1)).'</div>'; fclose($handle);
											} else {
											echo '<div class="alert alert-info">'.sprintf($entry_file_unchanged, substr($filename,strrpos($filename, "/")+1)).'</div>';
											}
											} else {
											echo '<div class="alert alert-danger">'.sprintf($entry_file_not_writable, substr($filename,strrpos($filename, "/")+1)).'</div>';
											}
											?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
										<div class="col-sm-10">
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_css_enabled" value="1" <?php if ($moneymaker2_common_css_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_css_enabled" value="0" <?php if (!$moneymaker2_common_css_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_code; ?></label>
										<div class="col-sm-10">
											<textarea name="moneymaker2_common_css" rows="7" class="form-control"><?php echo isset($moneymaker2_common_css) ? $moneymaker2_common_css : ''; ?></textarea>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<legend><?php echo $entry_themes; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_themes_help; ?><br /></p>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_primary_color; ?></label>
										<div class="col-sm-offset-2 col-sm-5">
											<input type="text" name="moneymaker2_common_themes_color_primary" value="<?php echo $moneymaker2_common_themes_color_primary; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_primary_help; ?></small></p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_computed_colors; ?></label>
										<div class="col-sm-10">
											<p class="alert alert-warning">
												<?php echo $entry_computed_colors_help; ?>
											</p>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_darken_15" value="<?php echo $moneymaker2_common_themes_color_darken_15; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_darken_15_help; ?></small></p>
										</div>
										<div class="col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_darken_10" value="<?php echo $moneymaker2_common_themes_color_darken_10; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_darken_10_help; ?></small></p>
										</div>
										<div class="col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_darken_5" value="<?php echo $moneymaker2_common_themes_color_darken_5; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_darken_5_help; ?></small></p>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_darken_30" value="<?php echo $moneymaker2_common_themes_color_darken_30; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_darken_30_help; ?></small></p>
										</div>
										<div class="col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_darken_17" value="<?php echo $moneymaker2_common_themes_color_darken_17; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_darken_17_help; ?></small></p>
										</div>
										<div class="col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_lighten_20" value="<?php echo $moneymaker2_common_themes_color_lighten_20; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_lighten_20_help; ?></small></p>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_lighten_17" value="<?php echo $moneymaker2_common_themes_color_lighten_17; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_lighten_17_help; ?></small></p>
										</div>
										<div class="col-sm-3">
											<input type="text" name="moneymaker2_common_themes_color_lighten_25" value="<?php echo $moneymaker2_common_themes_color_lighten_25; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_computed_color_lighten_25_help; ?></small></p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
										<div class="col-sm-10">
										<input type="hidden" name="moneymaker2_common_themes_colors_changed" value="0" />
										<?php $moneymaker2_common_themes_color_rgb_lighten_20 = sscanf($moneymaker2_common_themes_color_lighten_20, "#%02x%02x%02x");
										$moneymaker2_common_themes_color_codes = array('moneymaker2_common_themes_color_primary','moneymaker2_common_themes_color_darken_15','moneymaker2_common_themes_color_darken_10','moneymaker2_common_themes_color_darken_5','moneymaker2_common_themes_color_darken_30','moneymaker2_common_themes_color_darken_17','moneymaker2_common_themes_color_lighten_20','moneymaker2_common_themes_color_rgb_lighten_20','moneymaker2_common_themes_color_lighten_17','moneymaker2_common_themes_color_lighten_25');
										$moneymaker2_common_themes_colors = array($moneymaker2_common_themes_color_primary,$moneymaker2_common_themes_color_darken_15,$moneymaker2_common_themes_color_darken_10,$moneymaker2_common_themes_color_darken_5,$moneymaker2_common_themes_color_darken_30,$moneymaker2_common_themes_color_darken_17,$moneymaker2_common_themes_color_lighten_20,$moneymaker2_common_themes_color_rgb_lighten_20[0].','.$moneymaker2_common_themes_color_rgb_lighten_20[1].','.$moneymaker2_common_themes_color_rgb_lighten_20[2],$moneymaker2_common_themes_color_lighten_17,$moneymaker2_common_themes_color_lighten_25);
										$moneymaker2_filename_reading = '../catalog/view/theme/moneymaker2/stylesheet/bootstrap-theme-colors-draft.css';
										$moneymaker2_filename_writing = '../catalog/view/theme/moneymaker2/stylesheet/bootstrap-theme-colors.store'.$moneymaker2_store_id.'.css';
										if ($moneymaker2_permission&&fopen($moneymaker2_filename_writing, 'w')&&file_exists($moneymaker2_filename_writing)&&filesize($moneymaker2_filename_writing)==0) $moneymaker2_common_themes_colors_changed = 1;
										if ($moneymaker2_permission&&$moneymaker2_common_themes_colors_changed) {
											if (file_exists($moneymaker2_filename_reading)) {
												$reading = fopen($moneymaker2_filename_reading, 'r');
												$writing = fopen($moneymaker2_filename_writing, 'w');
												if (is_writable($moneymaker2_filename_writing)) {
													if ($moneymaker2_common_themes_colors) {
														if (!$reading) { echo '<div class="alert alert-danger">'.sprintf($entry_file_not_opened, substr($moneymaker2_filename_reading,strrpos($moneymaker2_filename_reading, "/")+1)).'</div>'; exit; }
														if (!$writing) { echo '<div class="alert alert-danger">'.sprintf($entry_file_not_opened, substr($moneymaker2_filename_writing,strrpos($moneymaker2_filename_writing, "/")+1)).'</div>'; exit; }
														while (!feof($reading)) {
															$line = fgets($reading);
															foreach ($moneymaker2_common_themes_color_codes as $key => $value ) {
																if (stristr($line,$value)) {
																	$line = str_replace($value, $moneymaker2_common_themes_colors[$key], $line);
																}
															}
															if (fwrite($writing, $line) === FALSE) { echo '<div class="alert alert-danger">'.sprintf($entry_file_not_writable, substr($moneymaker2_filename_writing,strrpos($moneymaker2_filename_writing, "/")+1)).'</div>'; exit; }
														}
														fclose($reading); fclose($writing);
														echo '<div class="alert alert-info">'.sprintf($entry_file_updated, substr($moneymaker2_filename_writing,strrpos($moneymaker2_filename_writing, "/")+1)).'</div>';
													} else {
														echo '<div class="alert alert-danger">'.sprintf($entry_file_unchanged, substr($moneymaker2_filename_writing,strrpos($moneymaker2_filename_writing, "/")+1)).'</div>';
													}
												} else {
													echo '<div class="alert alert-danger">'.sprintf($entry_file_not_writable, substr($moneymaker2_filename_writing,strrpos($moneymaker2_filename_writing, "/")+1)).'</div>';
												}
											} else {
												echo '<div class="alert alert-danger">'.sprintf($entry_file_not_found, substr($moneymaker2_filename_reading,strrpos($moneymaker2_filename_reading, "/")+1)).'</div>';
											}
										} else {
											echo '<div class="alert alert-info">'.sprintf($entry_file_unchanged, substr($moneymaker2_filename_writing,strrpos($moneymaker2_filename_writing, "/")+1)).'</div>';
										} ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_background; ?></label>
										<div class="col-sm-4">
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_themes_bg_mode" value="1" <?php if ($moneymaker2_common_themes_bg_mode) { ?>checked="checked"<?php } ?> /> <?php echo $entry_image; ?></label>
											<label class="radio-inline"><input type="radio" name="moneymaker2_common_themes_bg_mode" value="0" <?php if (!$moneymaker2_common_themes_bg_mode) { ?>checked="checked"<?php } ?> /> <?php echo $entry_color; ?></label>
										</div>
										<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
										<div class="col-sm-3">
											<input type="text" name="moneymaker2_common_themes_bg_color" value="<?php echo $moneymaker2_common_themes_bg_color; ?>"  class="form-control colorpicker" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
										<div class="col-sm-4">
											<a href="" id="moneymaker2_common_themes_image_src_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $moneymaker2_common_themes_thumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_common_themes_image_src" value="<?php echo $moneymaker2_common_themes_image_src; ?>" id="moneymaker2_common_themes_image_src_input" />
										</div>
										<label class="col-sm-2 control-label"><?php echo $entry_image_bg_properties; ?></label>
										<div class="col-sm-3">
											<select name="moneymaker2_common_themes_bg_fixation" class="form-control">
												<?php foreach ($moneymaker2_bg_fixations as $value) { ?>
												<?php ($value ==  $moneymaker2_common_themes_bg_fixation) ? $active = 'selected' : $active=''; ?>
												<option value="<?php echo $value; ?>" <?php echo $active; ?>><?php echo $value; ?></option>
												<?php } ?>
											</select>
											<select name="moneymaker2_common_themes_bg_position" class="form-control">
												<?php foreach ($moneymaker2_bg_positions as $value) { ?>
												<?php ($value ==  $moneymaker2_common_themes_bg_position) ? $active = 'selected' : $active=''; ?>
												<option value="<?php echo $value; ?>" <?php echo $active; ?>><?php echo $value; ?></option>
												<?php } ?>
											</select>
											<select name="moneymaker2_common_themes_bg_repeat" class="form-control">
												<?php foreach ($moneymaker2_bg_repeats as $value) { ?>
												<?php ($value ==  $moneymaker2_common_themes_bg_repeat) ? $active = 'selected' : $active=''; ?>
												<option value="<?php echo $value; ?>" <?php echo $active; ?>><?php echo $value; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<legend><?php echo $entry_categories; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_common_categories_help; ?><br /></p>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_categories_icons_help; ?>"><?php echo $entry_common_custom_icons; ?></span></label>
										<div class="col-md-4 col-sm-5">
											<a href="#moneymaker2_categories" class="btn btn-block btn-default" data-toggle="collapse"><?php echo $entry_categories; ?> <i class="fa fa-angle-down"></i></a>
										</div>
										<div class="col-md-4 col-sm-5">
											<select name="moneymaker2_common_categories_icons_enabled" id="moneymaker2_common_categories_icons_enabled" class="form-control">
												<?php if ($moneymaker2_common_categories_icons_enabled) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<input type="hidden" name="moneymaker2_common_categories_icons_keys" value="" />
									<input type="hidden" name="moneymaker2_common_categories_icons_values" value="" />
									<input type="hidden" name="moneymaker2_common_categories_icons" value="" />
									<div class="collapse" id="moneymaker2_categories">
									<?php foreach ($categories as $key => $row) {$name[$key]  = $row['name']; $category_id[$key] = $row['category_id']; } ?>
									<?php array_multisort($name, SORT_ASC, $category_id, SORT_ASC, $categories); ?>
									<?php foreach ($categories as $category) { ?>
										<div class="row form-inline">
											<div class="col-md-6 col-sm-7 text-right">
												<p class="paddingtop <?php if ($category['parent_id'] == 0) { ?>strong<?php } ?>"><?php echo $category['name'] ?></p>
											</div>
											<div class="col-md-4 col-sm-5">
												<?php $first = true; ?>
												<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if (isset($moneymaker2_common_categories_icons[$category['category_id']])&&$moneymaker2_common_categories_icons[$category['category_id']] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_common_categories_icons[<?php echo $category['category_id']; ?>]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_common_categories_icons[<?php echo $category['category_id']; ?>]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?><?php if ($first) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_common_categories_icons[<?php echo $category['category_id']; ?>]"><i class="fa"></i> <span>-</span></button><input type="hidden" name="moneymaker2_common_categories_icons[<?php echo $category['category_id']; ?>]" value="-" /><?php } ?>
											</div>
										</div>
									<?php } ?>
									</div>
								</fieldset>
								<fieldset>
									<legend><?php echo $entry_products; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_common_products_help; ?><br /></p>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_products_title_overflow_help; ?>"><?php echo $entry_common_products_title_overflow; ?></span></label>
										<div class="col-md-8 col-sm-10">
											<select name="moneymaker2_common_products_title_overflow" class="form-control">
												<?php foreach ($moneymaker2_title_overflow_modes as $key => $moneymaker2_title_overflow_mode) { ?>
												<option value="<?php echo $key; ?>" <?php if ($moneymaker2_common_products_title_overflow == $key) { ?>selected="selected"<?php } ?>><?php echo $moneymaker2_title_overflow_mode; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_stock_status_color; ?></label>
										<div class="col-sm-4">
											<input type="text" name="moneymaker2_catalog_products_stock_color[0]" value="<?php echo $moneymaker2_catalog_products_stock_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_instock; ?></small></p>
										</div>
										<div class="col-sm-4">
											<input type="text" name="moneymaker2_catalog_products_stock_color[1]" value="<?php echo $moneymaker2_catalog_products_stock_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_other; ?></small></p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_product_code_field; ?></label>
										<div class="col-sm-4">
											<select name="moneymaker2_catalog_products_code_field" class="form-control">
												<?php foreach ($moneymaker2_custom_fields as $moneymaker2_custom_field) { ?>
												<?php ($moneymaker2_custom_field ==  $moneymaker2_catalog_products_code_field) ? $active = 'selected' : $active=''; ?>
												<option value="<?php echo $moneymaker2_custom_field; ?>" <?php echo $active; ?>><?php echo $moneymaker2_custom_field; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<legend><?php echo $entry_informations; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_common_informations_help; ?><br /></p>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_common_custom_icons; ?></label>
										<div class="col-md-4 col-sm-5">
											<a href="#moneymaker2_informations" class="btn btn-block btn-default" data-toggle="collapse"><?php echo $entry_informations; ?> <i class="fa fa-angle-down"></i></a>
										</div>
										<div class="col-md-4 col-sm-5">
											<select name="moneymaker2_common_informations_icons_enabled" id="moneymaker2_common_informations_icons_enabled" class="form-control">
												<?php if ($moneymaker2_common_informations_icons_enabled) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<input type="hidden" name="moneymaker2_common_informations_icons_keys" value="" />
									<input type="hidden" name="moneymaker2_common_informations_icons_values" value="" />
									<input type="hidden" name="moneymaker2_common_informations_icons" value="" />
									<div class="collapse" id="moneymaker2_informations">
										<?php foreach ($informations as $information) { ?>
										<div class="row form-inline">
											<div class="col-md-6 col-sm-7 text-right">
												<p class="paddingtop"><?php echo $information['title'] ?></p>
											</div>
											<div class="col-md-4 col-sm-5">
												<?php $first = true; ?>
												<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if (isset($moneymaker2_common_informations_icons[$information['information_id']])&&$moneymaker2_common_informations_icons[$information['information_id']] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_common_informations_icons[<?php echo $information['information_id']; ?>]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_common_informations_icons[<?php echo $information['information_id']; ?>]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?><?php if ($first) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_common_informations_icons[<?php echo $information['information_id']; ?>]"><i class="fa"></i> <span>-</span></button><input type="hidden" name="moneymaker2_common_informations_icons[<?php echo $information['information_id']; ?>]" value="-" /><?php } ?>
											</div>
										</div>
										<?php } ?>
									</div>
								</fieldset>
								<fieldset>
									<div class="form-group hidden">
										<label class="col-sm-2 control-label" for="input-directory"><?php echo $entry_directory; ?></label>
										<div class="col-sm-10">
											<select name="theme_moneymaker2_directory" id="input-directory" class="form-control">
												<?php foreach ($directories as $directory) { ?>
												<?php if ($directory == $theme_moneymaker2_directory) { ?>
												<option value="<?php echo $directory; ?>" selected="selected"><?php echo $directory; ?></option>
												<?php } else { ?>
												<option value="<?php echo $directory; ?>"><?php echo $directory; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<legend><?php echo $text_image; ?></legend>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-category-width"><?php echo $entry_image_category; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_category_width" value="<?php echo $moneymaker2_image_category_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-category-width" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_category_height" value="<?php echo $moneymaker2_image_category_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_category) { ?>
											<div class="text-danger"><?php echo $error_image_category; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_thumb_width" value="<?php echo $moneymaker2_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_thumb_height" value="<?php echo $moneymaker2_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_thumb) { ?>
											<div class="text-danger"><?php echo $error_image_thumb; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_image_popup; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_popup_width" value="<?php echo $moneymaker2_image_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_popup_height" value="<?php echo $moneymaker2_image_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_popup) { ?>
											<div class="text-danger"><?php echo $error_image_popup; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-product-width"><?php echo $entry_image_product; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_product_width" value="<?php echo $moneymaker2_image_product_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-product-width" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_product_height" value="<?php echo $moneymaker2_image_product_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_product) { ?>
											<div class="text-danger"><?php echo $error_image_product; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-additional-width"><?php echo $entry_image_additional; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_additional_width" value="<?php echo $moneymaker2_image_additional_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-additional-width" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_additional_height" value="<?php echo $moneymaker2_image_additional_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_additional) { ?>
											<div class="text-danger"><?php echo $error_image_additional; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-related"><?php echo $entry_image_related; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_related_width" value="<?php echo $moneymaker2_image_related_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-related" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_related_height" value="<?php echo $moneymaker2_image_related_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_related) { ?>
											<div class="text-danger"><?php echo $error_image_related; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-compare"><?php echo $entry_image_compare; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_compare_width" value="<?php echo $moneymaker2_image_compare_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-compare" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_compare_height" value="<?php echo $moneymaker2_image_compare_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_compare) { ?>
											<div class="text-danger"><?php echo $error_image_compare; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-wishlist"><?php echo $entry_image_wishlist; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_wishlist_width" value="<?php echo $moneymaker2_image_wishlist_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-wishlist" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_wishlist_height" value="<?php echo $moneymaker2_image_wishlist_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_wishlist) { ?>
											<div class="text-danger"><?php echo $error_image_wishlist; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-cart"><?php echo $entry_image_cart; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_cart_width" value="<?php echo $moneymaker2_image_cart_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-cart" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_cart_height" value="<?php echo $moneymaker2_image_cart_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_cart) { ?>
											<div class="text-danger"><?php echo $error_image_cart; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-image-location"><?php echo $entry_image_location; ?></label>
										<div class="col-sm-10">
											<div class="row">
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_location_width" value="<?php echo $moneymaker2_image_location_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-location" class="form-control" />
												</div>
												<div class="col-sm-6">
													<input type="text" name="moneymaker2_image_location_height" value="<?php echo $moneymaker2_image_location_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
												</div>
											</div>
											<?php if ($error_image_location) { ?>
											<div class="text-danger"><?php echo $error_image_location; ?></div>
											<?php } ?>
										</div>
									</div>
								</fieldset>

							</div>

							<div class="tab-pane" id="tab_header">
							<fieldset>
								<legend><?php echo $entry_tab_header; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_help; ?><br /></p>
								</div>
							</fieldset>

							<fieldset class="margin-top">
								<legend><?php echo $entry_header_alert; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_alert_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_alert" value="1" <?php if ($moneymaker2_header_alert) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_alert" value="0" <?php if (!$moneymaker2_header_alert) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_background; ?></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_alert_bg_color" value="<?php echo $moneymaker2_header_alert_bg_color; ?>"  class="form-control colorpicker" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-9">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="moneymaker2_header_alert_text[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_header_alert_text[$language['language_id']]) ? $moneymaker2_header_alert_text[$language['language_id']] : ''; ?></textarea>
											<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
										</div>
										<?php } ?>
										<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
									</div>
								</div>
							</fieldset>

							<fieldset >
								<legend><?php echo $entry_top_menu; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_strip_expanded; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_expanded" value="1" <?php if ($moneymaker2_header_strip_expanded) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_expanded" value="0" <?php if (!$moneymaker2_header_strip_expanded) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_strip_fixed_help; ?>"><?php echo $entry_header_strip_fixed; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_fixed" value="1" <?php if ($moneymaker2_header_strip_fixed) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_fixed" value="0" <?php if (!$moneymaker2_header_strip_fixed) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_strip_toggle_cart; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_toggle_cart" value="1" <?php if ($moneymaker2_header_strip_toggle_cart) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_toggle_cart" value="0" <?php if (!$moneymaker2_header_strip_toggle_cart) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_strip_toggle_search; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_toggle_search" value="1" <?php if ($moneymaker2_header_strip_toggle_search) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_toggle_search" value="0" <?php if (!$moneymaker2_header_strip_toggle_search) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_strip_toggle_language; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_toggle_language" value="1" <?php if ($moneymaker2_header_strip_toggle_language) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_strip_toggle_language" value="0" <?php if (!$moneymaker2_header_strip_toggle_language) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_strip_language; ?></label>
									<div class="col-md-6 col-sm-10">
										<select name="moneymaker2_header_strip_language" class="form-control">
											<?php foreach ($moneymaker2_header_strip_modes_full as $key => $value) { ?>
											<option value="<?php echo $key; ?>" <?php if ($moneymaker2_header_strip_language == $key) { ?>selected="selected"<?php } ?>><?php echo $value; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_strip_currency; ?></label>
									<div class="col-md-6 col-sm-10">
										<select name="moneymaker2_header_strip_currency" class="form-control">
											<?php foreach ($moneymaker2_header_strip_modes_full as $key => $value) { ?>
											<option value="<?php echo $key; ?>" <?php if ($moneymaker2_header_strip_currency == $key) { ?>selected="selected"<?php } ?>><?php echo $value; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_background; ?></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_strip_bg_color" value="<?php echo $moneymaker2_header_strip_bg_color; ?>"  class="form-control colorpicker" />
									</div>
									<label class="col-sm-offset-1 col-sm-2 control-label" for="moneymaker2_header_strip_bg_transparency"><?php echo $entry_opacity; ?></label>
									<div class="col-sm-3">
										<input class="bs-slider" name="moneymaker2_header_strip_bg_transparency" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="<?php echo $moneymaker2_header_strip_bg_transparency; ?>" data-slider-ticks="[1, 50, 100]" data-slider-ticks-snap-bounds="1" data-slider-ticks-labels='["1%", "50%", "100%"]' />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_strip_font_color_help; ?>"><?php echo $entry_font_color; ?></span></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_strip_font_color[0]" value="<?php echo $moneymaker2_header_strip_font_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_strip_font_color[1]" value="<?php echo $moneymaker2_header_strip_font_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_strip_font_color[2]" value="<?php echo $moneymaker2_header_strip_font_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-3">
										<input type="text" name="moneymaker2_header_strip_sl_font_color[0]" value="<?php echo $moneymaker2_header_strip_sl_font_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?><br />(<?php echo $entry_fullscreen_slideshow; ?>)</small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_strip_sl_font_color[1]" value="<?php echo $moneymaker2_header_strip_sl_font_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?><br />(<?php echo $entry_fullscreen_slideshow; ?>)</small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_strip_sl_font_color[2]" value="<?php echo $moneymaker2_header_strip_sl_font_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?><br />(<?php echo $entry_fullscreen_slideshow; ?>)</small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_logo; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_logo_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_logo_custom; ?></label>
									<div class="col-lg-3 col-md-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_logo_custom" value="1" <?php if ($moneymaker2_header_logo_custom) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_logo_custom" value="0" <?php if (!$moneymaker2_header_logo_custom) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-lg-3 col-md-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_header_logo_custom_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_logo_custom_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_logo_custom_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_color; ?> 1</label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_color1[0]" value="<?php echo $moneymaker2_header_logo_custom_color1[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_color1[1]" value="<?php echo $moneymaker2_header_logo_custom_color1[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_color1[2]" value="<?php echo $moneymaker2_header_logo_custom_color1[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_color; ?> 2</label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_color2[0]" value="<?php echo $moneymaker2_header_logo_custom_color2[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_color2[1]" value="<?php echo $moneymaker2_header_logo_custom_color2[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_color2[2]" value="<?php echo $moneymaker2_header_logo_custom_color2[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header; ?></label>
									<div class="col-lg-9 col-md-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_logo_custom_header[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_logo_custom_header[$language['language_id']]) ? $moneymaker2_header_logo_custom_header[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_header_color[0]" value="<?php echo $moneymaker2_header_logo_custom_header_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_header_color[1]" value="<?php echo $moneymaker2_header_logo_custom_header_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_header_color[2]" value="<?php echo $moneymaker2_header_logo_custom_header_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
									<div class="col-lg-9 col-md-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_logo_custom_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_logo_custom_caption[$language['language_id']]) ? $moneymaker2_header_logo_custom_caption[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_caption_color[0]" value="<?php echo $moneymaker2_header_logo_custom_caption_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_caption_color[1]" value="<?php echo $moneymaker2_header_logo_custom_caption_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_logo_custom_caption_color[2]" value="<?php echo $moneymaker2_header_logo_custom_caption_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_contacts; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_contacts_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="moneymaker2_header_contacts_phone"><span data-toggle="tooltip" title="<?php echo $entry_header_contacts_phone_help; ?>"><?php echo $entry_telephone; ?></span></label>
									<div class="col-lg-3 col-md-4">
										<input type="text" name="moneymaker2_header_contacts_phone" value="<?php echo isset($moneymaker2_header_contacts_phone) ? $moneymaker2_header_contacts_phone : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_contacts_phone" class="form-control" />
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-lg-3 col-md-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_header_contacts_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_contacts_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_contacts_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_contacts_phone_highlight; ?></label>
									<div class="col-lg-3 col-md-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_contacts_phone_highlight" value="1" <?php if ($moneymaker2_header_contacts_phone_highlight) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_contacts_phone_highlight" value="0" <?php if (!$moneymaker2_header_contacts_phone_highlight) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
									<div class="col-lg-3 col-md-4">
										<input type="text" name="moneymaker2_header_contacts_phone_highlight_color" value="<?php echo $moneymaker2_header_contacts_phone_highlight_color; ?>"  class="form-control colorpicker" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_contacts_caption_help; ?>"><?php echo $entry_caption; ?></span></label>
									<div class="col-lg-9 col-md-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_contacts_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_contacts_title[$language['language_id']]) ? $moneymaker2_header_contacts_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_contacts; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="row" id="vtab-header_contacts">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="header_contacts">
											<?php $header_contact_row = 1; ?>
											<?php foreach ($moneymaker2_header_contacts as $value) { ?>
											<li><a href="#tab-contact<?php echo $header_contact_row; ?>" data-toggle="tab" id="link-contact<?php echo $header_contact_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-contact<?php echo $header_contact_row; ?>\']').parent().remove(); $('#tab-contact<?php echo $header_contact_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $header_contact_row; ?></a></li>
											<?php $header_contact_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addHeaderContact();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $header_contact_row = 1; ?>
											<?php foreach ($moneymaker2_header_contacts as $value) { ?>
											<div class="tab-pane" id="tab-contact<?php echo $header_contact_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $header_contact_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_mode; ?></label>
													<div class="col-sm-10">
														<select name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][mode]" class="form-control">
															<option value="0"><?php echo $text_select ?></option>
															<?php foreach ($moneymaker2_contacts_modes as $key => $moneymaker2_contacts_mode) { ?>
															<option value="<?php echo $key; ?>" <?php if ($value['mode'] == $key) { ?>selected="selected"<?php } ?>><?php echo $moneymaker2_contacts_mode; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
													<div class="col-sm-3">
														<a href="" id="moneymaker2_header_contacts_image_thumb<?php echo $header_contact_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][image]" value="<?php echo $value['image']; ?>" id="moneymaker2_header_contacts_image_input<?php echo $header_contact_row; ?>" />
													</div>
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_contacts_link<?php echo $header_contact_row; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_header_contacts_sort_order<?php echo $header_contact_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_header_contacts[<?php echo $header_contact_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_contacts_sort_order<?php echo $header_contact_row; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $header_contact_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_categories_menu; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12">
										<?php echo $entry_header_categories_help; ?>
									</p>
									<div class="col-sm-12">
										<p class="alert alert-info">
											<?php echo $entry_header_categories_list_help; ?>
										</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hide" value="0" <?php if (!$moneymaker2_header_categories_menu_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hide" value="1" <?php if ($moneymaker2_header_categories_menu_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_header_categories_showchilds; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hidechilds" value="0" <?php if (!$moneymaker2_header_categories_menu_hidechilds) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hidechilds" value="1" <?php if ($moneymaker2_header_categories_menu_hidechilds) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_categories_caption_help; ?>"><?php echo $entry_caption; ?></span></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_categories_menu_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_categories_menu_caption[$language['language_id']]) ? $moneymaker2_header_categories_menu_caption[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_categories_menu; ?> ></span> <?php echo $entry_advanced; ?></legend>
								<div class="form-group margin-top">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_categories_mode_help; ?>"><?php echo $text_enabled; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_mod" value="1" <?php if ($moneymaker2_header_categories_menu_mod) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_mod" value="0" <?php if (!$moneymaker2_header_categories_menu_mod) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_header_categories_showparents; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hideparents" value="0" <?php if (!$moneymaker2_header_categories_menu_hideparents) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hideparents" value="1" <?php if ($moneymaker2_header_categories_menu_hideparents) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_images; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hidethumbs" value="0" <?php if (!$moneymaker2_header_categories_menu_hidethumbs) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_hidethumbs" value="1" <?php if ($moneymaker2_header_categories_menu_hidethumbs) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_categories_icons_help; ?>"><?php echo $entry_common_custom_icons; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_icons" value="1" <?php if ($moneymaker2_header_categories_menu_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_menu_icons" value="0" <?php if (!$moneymaker2_header_categories_menu_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_image_size; ?></label>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_header_categories_menu_thumbs_width" value="<?php echo $moneymaker2_header_categories_menu_thumbs_width; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_header_categories_menu_thumbs_height" value="<?php echo $moneymaker2_header_categories_menu_thumbs_height; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_columns; ?></label>
									<div class="col-sm-3">
										<select name="moneymaker2_header_categories_menu_columns[lg]" class="form-control">
											<?php for ($j = 2; $j <= count($moneymaker2_columns)+1; $j++) {
												($moneymaker2_header_categories_menu_columns['lg'] == $moneymaker2_columns[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns[$j]; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_large; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_header_categories_menu_columns[md]" class="form-control">
											<?php for ($j = 2; $j <= count($moneymaker2_columns)+1; $j++) {
												($moneymaker2_header_categories_menu_columns['md'] == $moneymaker2_columns[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns[$j]; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_medium; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_header_categories_menu_columns[sm]" class="form-control">
											<?php for ($j = 2; $j <= count($moneymaker2_columns)+1; $j++) {
												($moneymaker2_header_categories_menu_columns['sm'] == $moneymaker2_columns[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns[$j]; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_small; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_categories_menu; ?> > <?php echo $entry_advanced; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_categories_add_banner_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-header_banners">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="header_banners">
											<?php $header_banner_row = 1; ?>
											<?php foreach ($moneymaker2_header_banners as $value) { ?>
											<li><a href="#tab-banner<?php echo $header_banner_row; ?>" data-toggle="tab" id="link-banner<?php echo $header_banner_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-banner<?php echo $header_banner_row; ?>\']').parent().remove(); $('#tab-banner<?php echo $header_banner_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $header_banner_row; ?></a></li>
											<?php $header_banner_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addHeaderBanner();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $header_banner_row = 1; ?>
											<?php foreach ($moneymaker2_header_banners as $value) { ?>
											<div class="tab-pane" id="tab-banner<?php echo $header_banner_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $header_banner_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
													<div class="col-sm-10">
														<a href="" id="moneymaker2_header_banners_image_thumb<?php echo $header_banner_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][image]" value="<?php echo $value['image']; ?>" id="moneymaker2_header_banners_image_input<?php echo $header_banner_row; ?>" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>
													<div class="col-sm-10">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
															</div>
															<select name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][style]" class="form-control">
																<?php foreach ($moneymaker2_banners_styles as $moneymaker2_banners_style) { ?>
																<?php ($moneymaker2_banners_style ==  $value['style']) ? $active = 'selected' : $active=''; ?>
																<option value="<?php echo $moneymaker2_banners_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_style; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['name'][$language['language_id']]) ? $value['name'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<textarea name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][text][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
														<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
														</div>
														<?php } ?>
														<p class="text-right"><?php echo $entry_showeditor_help; ?></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_header_banners_link<?php echo $header_banner_row; ?>"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_banners_link<?php echo $header_banner_row; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_header_banners_sort_order<?php echo $header_banner_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_header_banners[<?php echo $header_banner_row; ?>][sort_order]" value="<?php echo isset($value['sort_order'])&&$value['sort_order'] ? $value['sort_order'] : '0'; ?>" id="moneymaker2_header_banners_sort_order<?php echo $header_banner_row; ?>" class="form-control"><p class="text-right"><?php echo $entry_header_categories_banners_sort_order_help; ?></p>
													</div>
												</div>
											</div>
											<?php $header_banner_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_categories_panel; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12">
										<?php echo $entry_header_categories_panel_help; ?>
									</p>
									<div class="col-sm-12">
										<p class="alert alert-info">
											<?php echo $entry_header_categories_list_help; ?>
										</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel" value="1" <?php if ($moneymaker2_header_categories_panel) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel" value="0" <?php if (!$moneymaker2_header_categories_panel) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_categories_panel_expanded; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_expanded" value="1" <?php if ($moneymaker2_header_categories_panel_expanded) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_expanded" value="0" <?php if (!$moneymaker2_header_categories_panel_expanded) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_categories_panel_fixed_help; ?>"><?php echo $entry_header_strip_fixed; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_fixed" value="1" <?php if ($moneymaker2_header_categories_panel_fixed) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_fixed" value="0" <?php if (!$moneymaker2_header_categories_panel_fixed) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_categories_showparents; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_hideparents" value="0" <?php if (!$moneymaker2_header_categories_panel_hideparents) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_hideparents" value="1" <?php if ($moneymaker2_header_categories_panel_hideparents) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_categories_icons_help; ?>"><?php echo $entry_common_custom_icons; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_icons" value="1" <?php if ($moneymaker2_header_categories_panel_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_icons" value="0" <?php if (!$moneymaker2_header_categories_panel_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_background; ?></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_bg_color" value="<?php echo $moneymaker2_header_categorystrip_bg_color; ?>"  class="form-control colorpicker" />
									</div>
									<label class="col-sm-offset-1 col-sm-2 control-label" for="moneymaker2_header_categorystrip_bg_transparency"><?php echo $entry_opacity; ?></label>
									<div class="col-sm-3">
										<input class="bs-slider" name="moneymaker2_header_categorystrip_bg_transparency" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="<?php echo $moneymaker2_header_categorystrip_bg_transparency; ?>" data-slider-ticks="[1, 50, 100]" data-slider-ticks-snap-bounds="1" data-slider-ticks-labels='["1%", "50%", "100%"]' />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_strip_font_color_help; ?>"><?php echo $entry_font_color; ?></span></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_font_color[0]" value="<?php echo $moneymaker2_header_categorystrip_font_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_font_color[1]" value="<?php echo $moneymaker2_header_categorystrip_font_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_font_color[2]" value="<?php echo $moneymaker2_header_categorystrip_font_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_sl_font_color[0]" value="<?php echo $moneymaker2_header_categorystrip_sl_font_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?><br />(<?php echo $entry_fullscreen_slideshow; ?>)</small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_sl_font_color[1]" value="<?php echo $moneymaker2_header_categorystrip_sl_font_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?><br />(<?php echo $entry_fullscreen_slideshow; ?>)</small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_categorystrip_sl_font_color[2]" value="<?php echo $moneymaker2_header_categorystrip_sl_font_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?><br />(<?php echo $entry_fullscreen_slideshow; ?>)</small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_categories_panel; ?> ></span> <?php echo $entry_advanced; ?></legend>
								<div class="form-group margin-top">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_categories_panel_mode_help; ?>"><?php echo $text_enabled; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_mod" value="1" <?php if ($moneymaker2_header_categories_panel_mod) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_mod" value="0" <?php if (!$moneymaker2_header_categories_panel_mod) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_header_categories_showchilds; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_hidechilds" value="0" <?php if (!$moneymaker2_header_categories_panel_hidechilds) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_hidechilds" value="1" <?php if ($moneymaker2_header_categories_panel_hidechilds) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_images; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_hidethumbs" value="0" <?php if (!$moneymaker2_header_categories_panel_hidethumbs) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_hidethumbs" value="1" <?php if ($moneymaker2_header_categories_panel_hidethumbs) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_common_categories_icons_help; ?>"><?php echo $entry_common_custom_icons; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_child_icons" value="1" <?php if ($moneymaker2_header_categories_panel_child_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_child_icons" value="0" <?php if (!$moneymaker2_header_categories_panel_child_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_categories_panel_description_help; ?>"><?php echo $entry_display_description; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_description" value="1" <?php if ($moneymaker2_header_categories_panel_description) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_categories_panel_description" value="0" <?php if (!$moneymaker2_header_categories_panel_description) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
									<div class="col-md-4 col-lg-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_header_categories_panel_description_limit" value="<?php echo $moneymaker2_header_categories_panel_description_limit; ?>"  class="form-control">
											<span class="input-group-addon"><?php echo $entry_symbols; ?></span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_categories; ?> (<b class="lowercase"><?php echo $entry_description; ?></b>)</label>
									<div class="col-sm-10">
										<div class="well well-sm">
											<input type="hidden" name="moneymaker2_header_categories_panel_description_categories" value="<?php echo ':'.implode('::',$moneymaker2_header_categories_panel_description_categories).':'; ?>" />
											<?php foreach ($categories as $category) { ?>
											<div class="checkbox">
												<label onclick="passCheckboxes($(this))">
													<?php if (in_array($category['category_id'], $moneymaker2_header_categories_panel_description_categories)) { ?>
													<div class="btn btn-sm btn-default active" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw fa-check"></i></div> <?php echo $category['name']; ?>
													<?php } else { ?>
													<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo $category['name']; ?>
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
										<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_image_size; ?></label>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_header_categories_panel_thumbs_width" value="<?php echo $moneymaker2_header_categories_panel_thumbs_width; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_header_categories_panel_thumbs_height" value="<?php echo $moneymaker2_header_categories_panel_thumbs_height; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_columns; ?></label>
									<div class="col-sm-3">
										<select name="moneymaker2_header_categories_panel_columns[lg]" class="form-control">
											<?php for ($j = 2; $j <= count($moneymaker2_columns)+1; $j++) {
												($moneymaker2_header_categories_panel_columns['lg'] == $moneymaker2_columns[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns[$j]; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_large; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_header_categories_panel_columns[md]" class="form-control">
											<?php for ($j = 2; $j <= count($moneymaker2_columns)+1; $j++) {
												($moneymaker2_header_categories_panel_columns['md'] == $moneymaker2_columns[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns[$j]; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_medium; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_header_categories_panel_columns[sm]" class="form-control">
											<?php for ($j = 2; $j <= count($moneymaker2_columns)+1; $j++) {
												($moneymaker2_header_categories_panel_columns['sm'] == $moneymaker2_columns[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns[$j]; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_small; ?></small></p>
									</div>
								</div>
							</fieldset>

							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_categories_panel; ?> > <?php echo $entry_advanced; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_categories_add_banner_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-header_panelbanners">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="header_panelbanners">
											<?php $header_panelbanner_row = 1; ?>
											<?php foreach ($moneymaker2_header_panelbanners as $value) { ?>
											<li><a href="#tab-panelbanner<?php echo $header_panelbanner_row; ?>" data-toggle="tab" id="link-panelbanner<?php echo $header_panelbanner_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-panelbanner<?php echo $header_panelbanner_row; ?>\']').parent().remove(); $('#tab-panelbanner<?php echo $header_panelbanner_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $header_panelbanner_row; ?></a></li>
											<?php $header_panelbanner_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addHeaderPanelbanner();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $header_panelbanner_row = 1; ?>
											<?php foreach ($moneymaker2_header_panelbanners as $value) { ?>
											<div class="tab-pane" id="tab-panelbanner<?php echo $header_panelbanner_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $header_panelbanner_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
													<div class="col-sm-10">
														<a href="" id="moneymaker2_header_panelbanners_image_thumb<?php echo $header_panelbanner_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][image]" value="<?php echo $value['image']; ?>" id="moneymaker2_header_panelbanners_image_input<?php echo $header_panelbanner_row; ?>" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>
													<div class="col-sm-10">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
															</div>
															<select name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][style]" class="form-control">
																<?php foreach ($moneymaker2_banners_styles as $moneymaker2_panelbanners_style) { ?>
																<?php ($moneymaker2_panelbanners_style ==  $value['style']) ? $active = 'selected' : $active=''; ?>
																<option value="<?php echo $moneymaker2_panelbanners_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_panelbanners_style; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['name'][$language['language_id']]) ? $value['name'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<textarea name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][text][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
															<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
														</div>
														<?php } ?>
														<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_header_panelbanners_link<?php echo $header_panelbanner_row; ?>"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_panelbanners_link<?php echo $header_panelbanner_row; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-5">
														<input type="number" min="0" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][sort_order_outer]" value="<?php echo isset($value['sort_order_outer'])&&$value['sort_order'] ? $value['sort_order_outer'] : '0'; ?>" class="form-control"><p class="text-center"><small><?php echo $entry_header_categories_banners_outer_sort_order_help; ?></small></p>
													</div>
													<div class="col-sm-5">
														<input type="number" min="0" name="moneymaker2_header_panelbanners[<?php echo $header_panelbanner_row; ?>][sort_order]" value="<?php echo isset($value['sort_order'])&&$value['sort_order'] ? $value['sort_order'] : '0'; ?>" class="form-control"><p class="text-center"><small><?php echo $entry_header_categories_banners_sort_order_help; ?></small></p>
													</div>
												</div>
											</div>
											<?php $header_panelbanner_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_categories_panel; ?> > <?php echo $entry_links; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="row" id="vtab-header_panellinks">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="header_panellinks">
											<?php $header_panellink_row = 1; ?>
											<?php foreach ($moneymaker2_header_panellinks as $value) { ?>
											<li><a href="#tab-hpanellink<?php echo $header_panellink_row; ?>" data-toggle="tab" id="link-hpanellink<?php echo $header_panellink_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-hpanellink<?php echo $header_panellink_row; ?>\']').parent().remove(); $('#tab-hpanellink<?php echo $header_panellink_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $header_panellink_row; ?></a></li>
											<?php $header_panellink_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addHeaderPanelLink();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $header_panellink_row = 1; ?>
											<?php foreach ($moneymaker2_header_panellinks as $value) { ?>
											<div class="tab-pane" id="tab-hpanellink<?php echo $header_panellink_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $header_panellink_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_panellinks[<?php echo $header_panellink_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_panellinks[<?php echo $header_panellink_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_panellinks[<?php echo $header_panellink_row; ?>][caption][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['caption'][$language['language_id']]) ? $value['caption'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_header_panellinks[<?php echo $header_panellink_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_panellinks[<?php echo $header_panellink_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_header_panellinks[<?php echo $header_panellink_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $header_panellink_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_cart; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_cart_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_caption; ?></label>
									<div class="col-lg-4 col-md-6 col-sm-10">
										<select name="moneymaker2_header_strip_cart" class="form-control">
											<?php foreach ($moneymaker2_header_strip_modes as $key => $value) { ?>
											<option value="<?php echo $key; ?>" <?php if ($moneymaker2_header_strip_cart == $key) { ?>selected="selected"<?php } ?>><?php echo $value; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_cart_custom; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_cart_custom" value="1" <?php if ($moneymaker2_header_cart_custom) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_cart_custom" value="0" <?php if (!$moneymaker2_header_cart_custom) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_cart_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_cart_caption[$language['language_id']]) ? $moneymaker2_header_cart_caption[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
									<div class="col-sm-3">
										<select name="moneymaker2_header_cart_effect" class="form-control">
											<?php if ($moneymaker2_header_cart_effect) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_header_cart_effect_color" value="<?php echo $moneymaker2_header_cart_effect_color; ?>"  class="form-control colorpicker" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>

										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="moneymaker2_header_cart_text[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_header_cart_text[$language['language_id']]) ? $moneymaker2_header_cart_text[$language['language_id']] : ''; ?></textarea>
											<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
										</div>


										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_image; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_cart_image" value="1" <?php if ($moneymaker2_header_cart_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_cart_image" value="0" <?php if (!$moneymaker2_header_cart_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
									<div class="col-sm-10">
										<a href="" id="moneymaker2_header_cart_image_src_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $moneymaker2_header_cart_thumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_header_cart_image_src" value="<?php echo $moneymaker2_header_cart_image_src; ?>" id="moneymaker2_header_cart_image_src_input" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_button; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_cart_link_enabled" value="1" <?php if ($moneymaker2_header_cart_link_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_cart_link_enabled" value="0" <?php if (!$moneymaker2_header_cart_link_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-5">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_header_cart_link_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_cart_link_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_cart_link_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_button_title; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_cart_link_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_cart_link_title[$language['language_id']]) ? $moneymaker2_header_cart_link_title[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
									<div class="col-sm-10">
										<select name="moneymaker2_header_cart_link" class="form-control">
											<option value="0"><?php echo $text_select ?></option>
											<?php foreach ($informations as $information) { ?>
											<option value="<?php echo $information['information_id']; ?>" <?php if ($information['information_id'] == $moneymaker2_header_cart_link) { ?>selected="selected"<?php } ?>><?php echo $information['title'] ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_search; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_search_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_caption; ?></label>
									<div class="col-lg-4 col-md-6 col-sm-10">
										<select name="moneymaker2_header_strip_search" class="form-control">
											<?php foreach ($moneymaker2_header_strip_modes as $key => $value) { ?>
											<option value="<?php echo $key; ?>" <?php if ($moneymaker2_header_strip_search == $key) { ?>selected="selected"<?php } ?>><?php echo $value; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_header_search_moved_help; ?>"><?php echo $entry_header_search_moved; ?></span></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_moved" value="1" <?php if ($moneymaker2_header_search_moved) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_moved" value="0" <?php if (!$moneymaker2_header_search_moved) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_search_ajax; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax" value="1" <?php if ($moneymaker2_header_search_ajax) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax" value="0" <?php if (!$moneymaker2_header_search_ajax) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_image; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax_image" value="1" <?php if ($moneymaker2_header_search_ajax_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax_image" value="0" <?php if (!$moneymaker2_header_search_ajax_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_size; ?></label>
									<div class="col-sm-2">
										<input type="number" min="1" name="moneymaker2_header_search_ajax_image_width" value="<?php echo $moneymaker2_header_search_ajax_image_width; ?>"  id="moneymaker2_header_search_ajax_image_width" class="form-control"><p class="text-center"><small><?php echo $entry_width; ?></small></p>
									</div>
									<div class="col-sm-2">
										<input type="number" min="1" name="moneymaker2_header_search_ajax_image_height" value="<?php echo $moneymaker2_header_search_ajax_image_height; ?>"  id="moneymaker2_header_search_ajax_image_height" class="form-control"><p class="text-center"><small><?php echo $entry_height; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_search_ajax_price; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax_price" value="1" <?php if ($moneymaker2_header_search_ajax_price) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax_price" value="0" <?php if (!$moneymaker2_header_search_ajax_price) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax_code" value="1" <?php if ($moneymaker2_header_search_ajax_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_search_ajax_code" value="0" <?php if (!$moneymaker2_header_search_ajax_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label" for="moneymaker2_header_search_ajax_code_field"><?php echo $entry_product_code_field; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_header_search_ajax_code_field" id="moneymaker2_header_search_ajax_code_field" class="form-control">
											<?php foreach ($moneymaker2_custom_fields as $moneymaker2_custom_field) { ?>
											<?php ($moneymaker2_custom_field ==  $moneymaker2_header_search_ajax_code_field) ? $active = 'selected' : $active=''; ?>
											<option value="<?php echo $moneymaker2_custom_field; ?>" <?php echo $active; ?>><?php echo $moneymaker2_custom_field; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_menu; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_menu_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_caption; ?></label>
									<div class="col-lg-4 col-md-6 col-sm-10">
										<select name="moneymaker2_header_strip_menu" class="form-control">
											<?php foreach ($moneymaker2_header_strip_modes as $key => $value) { ?>
											<option value="<?php echo $key; ?>" <?php if ($moneymaker2_header_strip_menu == $key) { ?>selected="selected"<?php } ?>><?php echo $value; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_menu; ?> ></span> <?php echo $entry_links; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header_menu_links_enabled; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_menu_links_enabled" value="1" <?php if ($moneymaker2_header_menu_links_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_menu_links_enabled" value="0" <?php if (!$moneymaker2_header_menu_links_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_header_menu_links_top_enabled; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_menu_links_top_enabled" value="1" <?php if ($moneymaker2_header_menu_links_top_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_header_menu_links_top_enabled" value="0" <?php if (!$moneymaker2_header_menu_links_top_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_header_menu_links_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_header_menu_links_caption[$language['language_id']]) ? $moneymaker2_header_menu_links_caption[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_menu; ?> > <?php echo $entry_links; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_header_menu_links_dropdown_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-header_links">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="header_links">
											<?php $header_link_row = 1; ?>
											<?php foreach ($moneymaker2_header_links as $value) { ?>
											<li><a href="#tab-hlink<?php echo $header_link_row; ?>" data-toggle="tab" id="link-hlink<?php echo $header_link_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-hlink<?php echo $header_link_row; ?>\']').parent().remove(); $('#tab-hlink<?php echo $header_link_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $header_link_row; ?></a></li>
											<?php $header_link_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addHeaderLink();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $header_link_row = 1; ?>
											<?php foreach ($moneymaker2_header_links as $value) { ?>
											<div class="tab-pane" id="tab-hlink<?php echo $header_link_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $header_link_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_links[<?php echo $header_link_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_header_links[<?php echo $header_link_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_links[<?php echo $header_link_row; ?>][caption][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['caption'][$language['language_id']]) ? $value['caption'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_header_links[<?php echo $header_link_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_header_links[<?php echo $header_link_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_header_links[<?php echo $header_link_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $header_link_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							</div>

							<div class="tab-pane" id="tab_catalog">
							<fieldset>
								<legend><?php echo $entry_tab_catalog; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_tab_catalog_help; ?><br /></p>
								</div>
							</fieldset>
							<fieldset class="margin-top">
								<legend><?php echo $entry_layout; ?> (<?php echo $entry_list; ?> / <?php echo $entry_grid; ?>)</legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_layout_default; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_catalog_layout_default" class="form-control">
											<?php if ($moneymaker2_catalog_layout_default) { ?>
											<option value="1" selected="selected"><?php echo $entry_list; ?></option>
											<option value="0"><?php echo $entry_grid; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $entry_list; ?></option>
											<option value="0" selected="selected"><?php echo $entry_grid; ?></option>
											<?php } ?>
										</select>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_layout_switcher; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_layout_switcher_hide" value="0" <?php if (!$moneymaker2_catalog_layout_switcher_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_layout_switcher_hide" value="1" <?php if ($moneymaker2_catalog_layout_switcher_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_categories_options; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_catalog_categories_metatitles_enabled_help; ?>"><?php echo $entry_catalog_categories_metatitles_enabled; ?></span></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_metatitles_enabled" value="1" <?php if ($moneymaker2_catalog_categories_metatitles_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_metatitles_enabled" value="0" <?php if (!$moneymaker2_catalog_categories_metatitles_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_categories_display_image; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_images_hide" value="0" <?php if (!$moneymaker2_catalog_categories_images_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_images_hide" value="1" <?php if ($moneymaker2_catalog_categories_images_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_categories_image_round; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_images_round" value="1" <?php if ($moneymaker2_catalog_categories_images_round) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_images_round" value="0" <?php if (!$moneymaker2_catalog_categories_images_round) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_categories_display_images; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_child_images" value="1" <?php if ($moneymaker2_catalog_categories_child_images) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_child_images" value="0" <?php if (!$moneymaker2_catalog_categories_child_images) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_catalog_categories_child_images_width" value="<?php echo $moneymaker2_catalog_categories_child_images_width; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_catalog_categories_child_images_height" value="<?php echo $moneymaker2_catalog_categories_child_images_height; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_categories_display_icons; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_child_icons" value="1" <?php if ($moneymaker2_catalog_categories_child_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_child_icons" value="0" <?php if (!$moneymaker2_catalog_categories_child_icons) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_categories_move_description; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_move_description" value="1" <?php if ($moneymaker2_catalog_categories_move_description) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_categories_move_description" value="0" <?php if (!$moneymaker2_catalog_categories_move_description) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
							</fieldset>

							<fieldset>
								<legend><?php echo $entry_catalog_categories_advantages; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_catalog_categories_advantages_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>
									<div class="col-sm-4 col-md-3">
										<select name="moneymaker2_catalog_categories_advantages_enabled" class="form-control">
											<?php if ($moneymaker2_catalog_categories_advantages_enabled) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_home_page; ?></label>
									<div class="col-sm-4 col-md-3"">
										<select name="moneymaker2_catalog_home_advantages_enabled" class="form-control">
											<?php if ($moneymaker2_catalog_home_advantages_enabled) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_decrease_size; ?></label>
									<div class="col-sm-4 col-md-3">
										<select name="moneymaker2_catalog_advantages_small" class="form-control">
											<?php if ($moneymaker2_catalog_advantages_small) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_catalog_categories_advantages; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_catalog_categories_advantages_add_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-categories_advantages">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="categories_advantages">
											<?php $categories_advantage_row = 1; ?>
											<?php foreach ($moneymaker2_categories_advantages as $value) { ?>
											<li><a href="#tab-cadvantage<?php echo $categories_advantage_row; ?>" data-toggle="tab" id="link-cadvantage<?php echo $categories_advantage_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-cadvantage<?php echo $categories_advantage_row; ?>\']').parent().remove(); $('#tab-cadvantage<?php echo $categories_advantage_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $categories_advantage_row; ?></a></li>
											<?php $categories_advantage_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addCategoriesAdvantage();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $categories_advantage_row = 1; ?>
											<?php foreach ($moneymaker2_categories_advantages as $value) { ?>
											<div class="tab-pane" id="tab-cadvantage<?php echo $categories_advantage_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $categories_advantage_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_categories_advantages[<?php echo $categories_advantage_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_categories_advantages[<?php echo $categories_advantage_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_categories; ?> (<?php echo $entry_pages; ?>)</label>
													<div class="col-sm-10">
														<div class="well well-sm">
															<input type="hidden" name="moneymaker2_categories_advantages[<?php echo $categories_advantage_row; ?>][categories]" value="<?php echo ':'.implode('::',$moneymaker2_categories_advantages[$categories_advantage_row-1]['categories']).':'; ?>" />
															<div class="checkbox">
																<label onclick="passCheckboxes($(this))">
																	<?php if (in_array('home', $value['categories'])) { ?>
																	<div class="btn btn-sm btn-default active" data-value="home"><i class="fa fa-fw fa-check"></i></div> <?php echo $entry_home_page; ?>
																	<?php } else { ?>
																	<div class="btn btn-sm btn-default" data-value="home"><i class="fa fa-fw"></i></div> <?php echo $entry_home_page; ?>
																	<?php } ?>
																</label>
															</div>
															<?php foreach ($categories as $category) { ?>
															<div class="checkbox">
																<label onclick="passCheckboxes($(this))">
																	<?php if (in_array($category['category_id'], $value['categories'])) { ?>
																	<div class="btn btn-sm btn-default active" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw fa-check"></i></div> <?php echo $category['name']; ?>
																	<?php } else { ?>
																	<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo $category['name']; ?>
																	<?php } ?>
																</label>
															</div>
															<?php } ?>
														</div>
														<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_header; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_categories_advantages[<?php echo $categories_advantage_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['name'][$language['language_id']]) ? $value['name'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_categories_advantages_link<?php echo $categories_advantage_row; ?>"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<select name="moneymaker2_categories_advantages[<?php echo $categories_advantage_row; ?>][link]" class="form-control">
															<option value="0"><?php echo $text_select ?></option>
															<?php foreach ($informations as $information) { ?>
															<option value="<?php echo $information['information_id']; ?>" <?php if ($information['information_id'] == $value['link']) { ?>selected="selected"<?php } ?>><?php echo $information['title'] ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>
													<div class="col-sm-10">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
															</div>
															<select name="moneymaker2_categories_advantages[<?php echo $categories_advantage_row; ?>][style]" class="form-control">
																<?php foreach ($moneymaker2_banners_styles as $moneymaker2_advantages_style) { ?>
																<?php ($moneymaker2_advantages_style ==  $value['style']) ? $active = 'selected' : $active=''; ?>
																<option value="<?php echo $moneymaker2_advantages_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_advantages_style; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</div>
											</div>
											<?php $categories_advantage_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_catalog_categories_advantages; ?> ></span> <?php echo $entry_home_page; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_header; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_catalog_home_advantages_header[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_catalog_home_advantages_header[$language['language_id']]) ? $moneymaker2_catalog_home_advantages_header[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_catalog_home_advantages_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_catalog_home_advantages_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_catalog_home_advantages_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="moneymaker2_catalog_home_advantages_text[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_catalog_home_advantages_text[$language['language_id']]) ? $moneymaker2_catalog_home_advantages_text[$language['language_id']] : ''; ?></textarea>
											<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
										</div>
										<?php } ?>
										<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_catalog_categories_advantages; ?> > <?php echo $entry_home_page; ?> > <?php echo $entry_links; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="row" id="vtab-categories_advantageslinks">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="categories_advantageslinks">
											<?php $categories_advantageslink_row = 1; ?>
											<?php foreach ($moneymaker2_categories_advantageslinks as $value) { ?>
											<li><a href="#tab-cadvantagelink<?php echo $categories_advantageslink_row; ?>" data-toggle="tab" id="link-cadvantagelink<?php echo $categories_advantageslink_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-cadvantagelink<?php echo $categories_advantageslink_row; ?>\']').parent().remove(); $('#tab-cadvantagelink<?php echo $categories_advantageslink_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $categories_advantageslink_row; ?></a></li>
											<?php $categories_advantageslink_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addCategoriesAdvantagesLink();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $categories_advantageslink_row = 1; ?>
											<?php foreach ($moneymaker2_categories_advantageslinks as $value) { ?>
											<div class="tab-pane" id="tab-cadvantagelink<?php echo $categories_advantageslink_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $categories_advantageslink_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_categories_advantageslinks[<?php echo $categories_advantageslink_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_categories_advantageslinks[<?php echo $categories_advantageslink_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_categories_advantageslinks[<?php echo $categories_advantageslink_row; ?>][caption][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['caption'][$language['language_id']]) ? $value['caption'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_categories_advantageslinks[<?php echo $categories_advantageslink_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_categories_advantageslinks[<?php echo $categories_advantageslink_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_categories_advantageslinks[<?php echo $categories_advantageslink_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $categories_advantageslink_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_products_options; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-addon"><?php echo $entry_list; ?></span>
											<select name="moneymaker2_catalog_products_list_stock_hide" class="form-control">
												<?php if (!$moneymaker2_catalog_products_list_stock_hide) { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-addon"><?php echo $entry_grid; ?></span>
											<select name="moneymaker2_catalog_products_grid_stock_hide" class="form-control">
												<?php if (!$moneymaker2_catalog_products_grid_stock_hide) { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-addon"><?php echo $entry_list; ?></span>
											<select name="moneymaker2_catalog_products_list_code_hide" class="form-control">
												<?php if (!$moneymaker2_catalog_products_list_code_hide) { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-addon"><?php echo $entry_grid; ?></span>
											<select name="moneymaker2_catalog_products_grid_code_hide" class="form-control">
												<?php if (!$moneymaker2_catalog_products_grid_code_hide) { ?>
												<option value="0" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="1"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="0"><?php echo $text_enabled; ?></option>
												<option value="1" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-addon"><?php echo $entry_list; ?></span>
											<select name="moneymaker2_catalog_products_list_description" class="form-control">
												<?php if ($moneymaker2_catalog_products_list_description) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="input-group">
											<span class="input-group-addon"><?php echo $entry_grid; ?></span>
											<select name="moneymaker2_catalog_products_grid_description" class="form-control">
												<?php if ($moneymaker2_catalog_products_grid_description) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
									<div class="col-sm-4">
										<input type="text" name="moneymaker2_product_limit" value="<?php echo $moneymaker2_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
										<?php if ($error_product_limit) { ?>
										<div class="text-danger"><?php echo $error_product_limit; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
									<div class="col-sm-4">
										<input type="text" name="moneymaker2_product_description_length" value="<?php echo $moneymaker2_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-description-limit" class="form-control" />
										<?php if ($error_product_description_length) { ?>
										<div class="text-danger"><?php echo $error_product_description_length; ?></div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_manufacturers; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_logo_size; ?></label>
									<div class="col-sm-4">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_catalog_manufacturer_logo_width" value="<?php echo $moneymaker2_catalog_manufacturer_logo_width; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
									</div>
									<div class="col-sm-4">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_catalog_manufacturer_logo_height" value="<?php echo $moneymaker2_catalog_manufacturer_logo_height; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_contacts; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_catalog_contacts_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_quicklinks; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_catalog_contacts_quicklinks" class="form-control">
											<?php if ($moneymaker2_catalog_contacts_quicklinks) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_contacts_call_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_catalog_contacts_call_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_catalog_contacts_call_title[$language['language_id']]) ? $moneymaker2_catalog_contacts_call_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_contacts_mail_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_catalog_contacts_mail_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_catalog_contacts_mail_title[$language['language_id']]) ? $moneymaker2_catalog_contacts_mail_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_map; ?> Google</label>
									<div class="col-sm-4">
										<select name="moneymaker2_catalog_contacts_map" class="form-control">
											<?php if ($moneymaker2_catalog_contacts_map) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<div class="col-sm-6">
										<p class="paddingtop"><small><?php echo $entry_catalog_contacts_map_help; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_contacts_map_key; ?></label>
									<div class="col-sm-4">
										<input type="text" name="moneymaker2_catalog_contacts_map_key" value="<?php echo isset($moneymaker2_catalog_contacts_map_key) ? $moneymaker2_catalog_contacts_map_key : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
									</div>
									<div class="col-sm-6">
										<p><small><?php echo $entry_catalog_contacts_map_key_help; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_map; ?> (<?php echo $entry_code; ?>)</label>
									<div class="col-sm-4">
										<select name="moneymaker2_catalog_contacts_map_custom" class="form-control">
											<?php if ($moneymaker2_catalog_contacts_map_custom) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<div class="col-sm-6">
										<input type="text" name="moneymaker2_catalog_contacts_map_custom_code" value="<?php echo isset($moneymaker2_catalog_contacts_map_custom_code) ? $moneymaker2_catalog_contacts_map_custom_code : ''; ?>" placeholder="<?php echo $entry_code; ?>" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_contacts_link_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_catalog_contacts_link_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_catalog_contacts_link_title[$language['language_id']]) ? $moneymaker2_catalog_contacts_link_title[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
									<div class="col-sm-4">
										<input type="text" name="moneymaker2_catalog_contacts_link" value="<?php echo isset($moneymaker2_catalog_contacts_link) ? $moneymaker2_catalog_contacts_link : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-offset-6 col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_catalog_contacts_multilink[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_catalog_contacts_multilink[$language['language_id']]) ? $moneymaker2_catalog_contacts_multilink[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
										</div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_compare; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_images; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_images_hide" value="0" <?php if (!$moneymaker2_catalog_compare_images_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_images_hide" value="1" <?php if ($moneymaker2_catalog_compare_images_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_display_model; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_model_hide" value="0" <?php if (!$moneymaker2_catalog_compare_model_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_model_hide" value="1" <?php if ($moneymaker2_catalog_compare_model_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_brand; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_brand_hide" value="0" <?php if (!$moneymaker2_catalog_compare_brand_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_brand_hide" value="1" <?php if ($moneymaker2_catalog_compare_brand_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_availability_hide" value="0" <?php if (!$moneymaker2_catalog_compare_availability_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_availability_hide" value="1" <?php if ($moneymaker2_catalog_compare_availability_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_rating; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_rating_hide" value="0" <?php if (!$moneymaker2_catalog_compare_rating_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_rating_hide" value="1" <?php if ($moneymaker2_catalog_compare_rating_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_description_hide" value="0" <?php if (!$moneymaker2_catalog_compare_description_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_description_hide" value="1" <?php if ($moneymaker2_catalog_compare_description_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_weight; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_weight_hide" value="0" <?php if (!$moneymaker2_catalog_compare_weight_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_weight_hide" value="1" <?php if ($moneymaker2_catalog_compare_weight_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_display_dimensions; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_dimensions_hide" value="0" <?php if (!$moneymaker2_catalog_compare_dimensions_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_dimensions_hide" value="1" <?php if ($moneymaker2_catalog_compare_dimensions_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_charts; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts_enabled" value="1" <?php if ($moneymaker2_catalog_compare_charts_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts_enabled" value="0" <?php if (!$moneymaker2_catalog_compare_charts_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_compare_charts_price_display; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts_price_enabled" value="1" <?php if ($moneymaker2_catalog_compare_charts_price_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts_price_enabled" value="0" <?php if (!$moneymaker2_catalog_compare_charts_price_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_columns; ?></label>
									<div class="col-sm-3">
										<select name="moneymaker2_catalog_compare_charts_columns[lg]" class="form-control">
											<?php for ($j = 0; $j <= count($moneymaker2_columns_bs)-1; $j++) {
												($moneymaker2_catalog_compare_charts_columns['lg'] == $moneymaker2_columns_bs[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns_bs[$j]; ?>" <?php echo $active; ?>><?php echo $moneymaker2_columns_bs[$j][1]; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_large; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_catalog_compare_charts_columns[md]" class="form-control">
											<?php for ($j = 0; $j <= count($moneymaker2_columns_bs)-1; $j++) {
												($moneymaker2_catalog_compare_charts_columns['md'] == $moneymaker2_columns_bs[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns_bs[$j]; ?>" <?php echo $active; ?>><?php echo $moneymaker2_columns_bs[$j][1]; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_medium; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_catalog_compare_charts_columns[sm]" class="form-control">
											<?php for ($j = 0; $j <= count($moneymaker2_columns_bs)-1; $j++) {
												($moneymaker2_catalog_compare_charts_columns['sm'] == $moneymaker2_columns_bs[$j]) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $moneymaker2_columns_bs[$j]; ?>" <?php echo $active; ?>><?php echo $moneymaker2_columns_bs[$j][1]; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_small; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_catalog_compare_chart_display_code; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts_code" value="1" <?php if ($moneymaker2_catalog_compare_charts_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts_code" value="0" <?php if (!$moneymaker2_catalog_compare_charts_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_product_code_field; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_catalog_compare_charts_code_field" class="form-control">
											<?php foreach ($moneymaker2_custom_fields as $moneymaker2_custom_field) { ?>
											<?php ($moneymaker2_custom_field ==  $moneymaker2_catalog_compare_charts_code_field) ? $active = 'selected' : $active=''; ?>
											<option value="<?php echo $moneymaker2_custom_field; ?>" <?php echo $active; ?>><?php echo $moneymaker2_custom_field; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_delimiter; ?></label>
									<div class="col-sm-3">
										<select name="moneymaker2_catalog_compare_charts_decimal_delimiter" class="form-control">
											<?php if ($moneymaker2_catalog_compare_charts_decimal_delimiter) { ?>
											<option value="1" selected="selected">,</option>
											<option value="0">.</option>
											<?php } else { ?>
											<option value="1">,</option>
											<option value="0" selected="selected">.</option>
											<?php } ?>
										</select>
									</div>
									<div class="col-sm-7">
										<p class="paddingtop"><?php echo $entry_catalog_compare_chart_decimal_delimiter_help; ?></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_compare; ?> ></span> <?php echo $entry_catalog_compare_chart_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_catalog_compare_chart_add_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-catalog_compare_charts">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="catalog_compare_charts">
											<?php $catalog_compare_chart_row = 1; ?>
											<?php foreach ($moneymaker2_catalog_compare_charts as $value) { ?>
											<li><a href="#tab-catalog_compare_chart<?php echo $catalog_compare_chart_row; ?>" data-toggle="tab" id="link-contact<?php echo $catalog_compare_chart_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-catalog_compare_chart<?php echo $catalog_compare_chart_row; ?>\']').parent().remove(); $('#tab-catalog_compare_chart<?php echo $catalog_compare_chart_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $catalog_compare_chart_row; ?></a></li>
											<?php $catalog_compare_chart_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addCatalogCompareChart();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $catalog_compare_chart_row = 1; ?>
											<?php foreach ($moneymaker2_catalog_compare_charts as $value) { ?>
											<div class="tab-pane" id="tab-catalog_compare_chart<?php echo $catalog_compare_chart_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $catalog_compare_chart_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_mode; ?></label>
													<div class="col-sm-10">
														<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts[<?php echo $catalog_compare_chart_row; ?>][mode]" value="0" <?php if (!$value['mode']) { ?>checked="checked"<?php } ?> /> <?php echo $entry_chart_line; ?></label>
														<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts[<?php echo $catalog_compare_chart_row; ?>][mode]" value="1" <?php if ($value['mode']) { ?>checked="checked"<?php } ?> /> <?php echo $entry_chart_bar; ?></label>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_catalog_compare_chart_functions; ?></label>
													<div class="col-sm-4">
														<select name="moneymaker2_catalog_compare_charts[<?php echo $catalog_compare_chart_row; ?>][fns]" class="form-control">
															<?php for ($j = 1; $j <= 5; $j++) {
												($value['fns'] == $j) ? $active = 'selected' : $active = ''; ?>
															<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
															<?php } ?>
														</select>
													</div>
													<label class="col-sm-2 control-label"><?php echo $entry_delimiter; ?></label>
													<div class="col-sm-4">
														<select name="moneymaker2_catalog_compare_charts[<?php echo $catalog_compare_chart_row; ?>][delimiter]" class="form-control">
															<option value="0"><?php echo $text_select ?></option>
															<?php foreach ($moneymaker2_delimiters as $moneymaker2_delimiter) { ?>
															<?php ($moneymaker2_delimiter ==  $value['delimiter']) ? $active = 'selected' : $active=''; ?>
															<option value="<?php echo $moneymaker2_delimiter; ?>" <?php echo $active; ?>><?php echo $moneymaker2_delimiter; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_attribute; ?></label>
													<div class="col-sm-10">
														<select name="moneymaker2_catalog_compare_charts[<?php echo $catalog_compare_chart_row; ?>][attribute]" class="form-control">
															<option value="0"><?php echo $text_select ?></option>
															<?php foreach ($attribute_groups as $attribute_group) { ?>
															<?php foreach ($attributes as $attribute) { ?>
															<?php if ($attribute['attribute_group_id'] == $attribute_group['attribute_group_id']) { ?>
															<?php ($attribute['attribute_id'] == $value['attribute']) ? $active = 'selected' : $active=''; ?>
															<option value="<?php echo $attribute['attribute_id']; ?>" <?php echo $active; ?>> <?php echo $attribute_group['name']; ?> > <?php echo $attribute['name']; ?></option>
															<?php } ?>
															<?php } ?>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_unit; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_catalog_compare_charts[<?php echo $catalog_compare_chart_row; ?>][unit][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['unit'][$language['language_id']]) ? $value['unit'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<p class="paddingtop"><?php echo $entry_catalog_compare_chart_sort_help; ?></p>
													</div>
												</div>
											</div>
											<?php $catalog_compare_chart_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							</div>

							<div class="tab-pane" id="tab_product">
							<fieldset>
								<legend><?php echo $entry_tab_product; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_tab_product_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_product_metatitles_enabled_help; ?>"><?php echo $entry_product_metatitles_enabled; ?></span></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_metatitles_enabled" class="form-control">
											<?php if ($moneymaker2_product_metatitles_enabled) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_social_bookmarking; ?> AddThis</label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_socials_addthis_enabled" class="form-control">
											<?php if ($moneymaker2_product_socials_addthis_enabled) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_social_bookmarking; ?> Yandex</label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_socials_yandex_enabled" class="form-control">
											<?php if ($moneymaker2_product_socials_yandex_enabled) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_product_code; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_header_product_code; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_code" value="1" <?php if ($moneymaker2_product_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_code" value="0" <?php if (!$moneymaker2_product_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_product_code_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_product_code_caption[$language['language_id']]) ? $moneymaker2_product_code_caption[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_attributes_product_code; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_attributes_code" value="1" <?php if ($moneymaker2_product_attributes_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_attributes_code" value="0" <?php if (!$moneymaker2_product_attributes_code) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_photogallery; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_product_gallery_moved; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_moved" value="1" <?php if ($moneymaker2_product_gallery_moved) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_moved" value="0" <?php if (!$moneymaker2_product_gallery_moved) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_product_gallery_round; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_round" value="1" <?php if ($moneymaker2_product_gallery_round) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_round" value="0" <?php if (!$moneymaker2_product_gallery_round) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_product_gallery_thumbs_round; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_thumbs_round" value="1" <?php if ($moneymaker2_product_gallery_thumbs_round) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_thumbs_round" value="0" <?php if (!$moneymaker2_product_gallery_thumbs_round) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_animation" value="1" <?php if ($moneymaker2_product_gallery_animation) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_gallery_animation" value="0" <?php if (!$moneymaker2_product_gallery_animation) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_animation_in; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_gallery_animation_in" class="form-control">
											<?php foreach ($moneymaker2_gallery_animation_styles as $moneymaker2_gallery_animation_style) { ?>
											<?php ($moneymaker2_gallery_animation_style ==  $moneymaker2_product_gallery_animation_in) ? $active = 'selected' : $active=''; ?>
											<option value="<?php echo $moneymaker2_gallery_animation_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_gallery_animation_style; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_product_thumbs; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[xlg]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['xlg'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_xlarge; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[lg]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['lg'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_large; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[md]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['md'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_medium; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[sm]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['sm'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_small; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[xsm]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['xsm'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_xsmall; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[xxsm]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['xxsm'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_xxsmall; ?></small></p>
									</div>
									<div class="col-sm-3">
										<select name="moneymaker2_product_thumbs_limit[xxxsm]" class="form-control">
											<?php for ($j = 1; $j <= 10; $j++) {
													($moneymaker2_product_thumbs_limit['xxxsm'] == $j) ? $active = 'selected' : $active = ''; ?>
											<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
											<?php } ?>
										</select><p class="text-center"><small><?php echo $entry_screen_xxxsmall; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_main_points; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_product_main_points_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_size; ?></label>
									<div class="col-sm-4">
										<div class="input-group">
											<div class="input-group-btn">
												<button type="button" class="btn btn-default" data-toggle="modal" data-target="#sizesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
											</div>
											<select name="moneymaker2_product_points_size" class="form-control">
												<?php foreach ($moneymaker2_stickers_sizes as $moneymaker2_stickers_size) { ?>
												<option value="<?php echo $moneymaker2_stickers_size; ?>" <?php if ($moneymaker2_product_points_size == $moneymaker2_stickers_size) { ?>selected="selected"<?php } ?>><?php echo $moneymaker2_stickers_size; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_main_points; ?> ></span> <?php echo $entry_stock_status; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-3">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_points_stock" value="1" <?php if ($moneymaker2_product_points_stock) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_points_stock" value="0" <?php if (!$moneymaker2_product_points_stock) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-3 control-label required"><span data-toggle="tooltip" title="<?php echo $entry_product_points_stock_default_help; ?>"><?php echo $entry_product_points_stock_default; ?></span></label>
									<div class="col-sm-4 col-md-3">
										<select name="moneymaker2_product_points_stock_default" class="form-control">
											<option value="0"><?php echo $text_select ?></option>
											<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php ($stock_status['stock_status_id'] == $moneymaker2_product_points_stock_default) ? $active = 'selected' : $active=''; ?>
											<option value="<?php echo $stock_status['stock_status_id']; ?>" <?php echo $active; ?>><?php echo $stock_status['name'] ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="product_stock_points">
											<?php foreach ($stock_statuses as $key => $stock_status) { ?>
											<li><a href="#tab-point-stock<?php echo $key; ?>" data-toggle="tab"><?php echo $stock_status['name']; ?></a></li>
											<?php } ?>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php foreach ($stock_statuses as $key => $stock_status) { ?>
											<div class="tab-pane" id="tab-point-stock<?php echo $key; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $stock_status['name']; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-4">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if (isset($moneymaker2_product_points_stock_icon[$stock_status['stock_status_id']])&&$moneymaker2_product_points_stock_icon[$stock_status['stock_status_id']] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_product_points_stock_icon[<?php echo $stock_status['stock_status_id']; ?>]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_product_points_stock_icon[<?php echo $stock_status['stock_status_id']; ?>]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?><?php if ($first) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_product_points_stock_icon[<?php echo $stock_status['stock_status_id']; ?>]"><i class="fa"></i> <span>-</span></button><input type="hidden" name="moneymaker2_product_points_stock_icon[<?php echo $stock_status['stock_status_id']; ?>]" value="-" /><?php } ?>
													</div>
													<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
													<div class="col-sm-3">
														<input type="text" name="moneymaker2_product_points_stock_color[<?php echo $stock_status['stock_status_id']; ?>]" value="<?php echo $moneymaker2_product_points_stock_color[$stock_status['stock_status_id']]; ?>"  class="form-control colorpicker" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-9">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<textarea name="moneymaker2_product_points_stock_caption[<?php echo $stock_status['stock_status_id']; ?>][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_product_points_stock_caption[$stock_status['stock_status_id']][$language['language_id']]) ? $moneymaker2_product_points_stock_caption[$stock_status['stock_status_id']][$language['language_id']] : ''; ?></textarea>
															<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
														</div>
														<?php } ?>
														<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
													</div>
												</div>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_main_points; ?> ></span> <?php echo $entry_manufacturer; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_points_manufacturer" value="1" <?php if ($moneymaker2_product_points_manufacturer) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_points_manufacturer" value="0" <?php if (!$moneymaker2_product_points_manufacturer) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_image_size; ?></label>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_product_points_manufacturer_image_width" value="<?php echo $moneymaker2_product_points_manufacturer_image_width; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_product_points_manufacturer_image_height" value="<?php echo $moneymaker2_product_points_manufacturer_image_height; ?>" class="form-control">
											<span class="input-group-addon"><?php echo $entry_px; ?></span>
										</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_caption; ?> (<?php echo $button_link; ?>)</label>
									<div class="col-sm-9">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_product_points_manufacturer_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_product_points_manufacturer_caption[$language['language_id']]) ? $moneymaker2_product_points_manufacturer_caption[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_main_points; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_product_points_add_point_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-product_points">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="product_points">
											<?php $product_point_row = 1; ?>
											<?php foreach ($moneymaker2_product_points as $value) { ?>
											<li><a href="#tab-point<?php echo $product_point_row; ?>" data-toggle="tab" id="link-point<?php echo $product_point_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-point<?php echo $product_point_row; ?>\']').parent().remove(); $('#tab-point<?php echo $product_point_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $product_point_row; ?></a></li>
											<?php $product_point_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addProductPoint();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $product_point_row = 1; ?>
											<?php foreach ($moneymaker2_product_points as $value) { ?>
											<div class="tab-pane" id="tab-point<?php echo $product_point_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $product_point_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_product_points[<?php echo $product_point_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_product_points[<?php echo $product_point_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>
													<div class="col-sm-10">
														<div class="well well-sm">
															<input type="hidden" name="moneymaker2_product_points[<?php echo $product_point_row; ?>][categories]" value="<?php echo ':'.implode('::',$moneymaker2_product_points[$product_point_row-1]['categories']).':'; ?>" />
															<?php foreach ($categories as $category) { ?>
															<div class="checkbox">
																<label onclick="passCheckboxes($(this))">
																	<?php if (in_array($category['category_id'], $value['categories'])) { ?>
																	<div class="btn btn-sm btn-default active" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw fa-check"></i></div> <?php echo $category['name']; ?>
																	<?php } else { ?>
																	<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo $category['name']; ?>
																	<?php } ?>
																</label>
															</div>
															<?php } ?>
														</div>
														<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_product_points[<?php echo $product_point_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['name'][$language['language_id']]) ? $value['name'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<textarea name="moneymaker2_product_points[<?php echo $product_point_row; ?>][text][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
															<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
														</div>
														<?php } ?>
														<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_product_points_sort_order<?php echo $product_point_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_product_points[<?php echo $product_point_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_product_points_sort_order<?php echo $product_point_row; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $product_point_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_options; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_product_options_hide; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_options_hide" class="form-control">
											<?php if ($moneymaker2_product_options_hide) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
									<div class="col-sm-4">
										<div class="input-group">
											<input type="number" min="1" name="moneymaker2_product_options_hide_limit" value="<?php echo $moneymaker2_product_options_hide_limit; ?>"  class="form-control">
											<span class="input-group-addon"><span class="lowercase"><?php echo $entry_options; ?></span></span>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_tabs; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_product_tabs_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_product_tabs_display_help; ?>"><?php echo $entry_product_tabs_display; ?></span></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_hide" value="0" <?php if (!$moneymaker2_product_tabs_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_hide" value="1" <?php if ($moneymaker2_product_tabs_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_product_tabs_headers; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_tabs_headers" class="form-control">
											<?php foreach ($moneymaker2_header_modes as $key => $value) { ?>
											<option value="<?php echo $key; ?>" <?php if ($moneymaker2_product_tabs_headers == $key) { ?>selected="selected"<?php } ?>><?php echo $value; ?></option>
											<?php } ?>
										</select>
										<p class="paddingtop"><?php echo $entry_product_tabs_headers_help; ?></p>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_product_tabs_headers_text[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_product_tabs_headers_text[$language['language_id']]) ? $moneymaker2_product_tabs_headers_text[$language['language_id']] : ''; ?>" class="form-control">
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_description_buttons; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_description_buttons" value="1" <?php if ($moneymaker2_product_tabs_description_buttons) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_description_buttons" value="0" <?php if (!$moneymaker2_product_tabs_description_buttons) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_display_attributes_buttons; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_buttons" value="1" <?php if ($moneymaker2_product_tabs_attributes_buttons) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_buttons" value="0" <?php if (!$moneymaker2_product_tabs_attributes_buttons) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_product_tabs_attributes_responsive; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_responsive" value="1" <?php if ($moneymaker2_product_tabs_attributes_responsive) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_responsive" value="0" <?php if (!$moneymaker2_product_tabs_attributes_responsive) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_weight; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_weight" value="1" <?php if ($moneymaker2_product_tabs_attributes_weight) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_weight" value="0" <?php if (!$moneymaker2_product_tabs_attributes_weight) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_display_dimensions; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_dimensions" value="1" <?php if ($moneymaker2_product_tabs_attributes_dimensions) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_attributes_dimensions" value="0" <?php if (!$moneymaker2_product_tabs_attributes_dimensions) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_product_tabs_reviews_indexed; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_reviews_indexed" value="1" <?php if ($moneymaker2_product_tabs_reviews_indexed) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_product_tabs_reviews_indexed" value="0" <?php if (!$moneymaker2_product_tabs_reviews_indexed) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_tabs; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_product_tabs_add_help; ?><br /></p>
								</div>
								<div class="row" id="vtab-product_tabs">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="product_tabs">
											<?php $product_tab_row = 1; ?>
											<?php foreach ($moneymaker2_product_tabs as $value) { ?>
											<li><a href="#tab-tab<?php echo $product_tab_row; ?>" data-toggle="tab" id="link-tab<?php echo $product_tab_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-tab<?php echo $product_tab_row; ?>\']').parent().remove(); $('#tab-tab<?php echo $product_tab_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $product_tab_row; ?></a></li>
											<?php $product_tab_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addProductTab();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $product_tab_row = 1; ?>
											<?php foreach ($moneymaker2_product_tabs as $value) { ?>
											<div class="tab-pane" id="tab-tab<?php echo $product_tab_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $product_tab_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>
													<div class="col-sm-10">
														<div class="well well-sm">
															<input type="hidden" name="moneymaker2_product_tabs[<?php echo $product_tab_row; ?>][categories]" value="<?php echo ':'.implode('::',$moneymaker2_product_tabs[$product_tab_row-1]['categories']).':'; ?>" />
															<?php foreach ($categories as $category) { ?>
															<div class="checkbox">
																<label onclick="passCheckboxes($(this))">
																	<?php if (in_array($category['category_id'], $value['categories'])) { ?>
																	<div class="btn btn-sm btn-default active" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw fa-check"></i></div> <?php echo $category['name']; ?>
																	<?php } else { ?>
																	<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo $category['name']; ?>
																	<?php } ?>
																</label>
															</div>
															<?php } ?>
														</div>
														<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_product_tabs[<?php echo $product_tab_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['name'][$language['language_id']]) ? $value['name'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<select name="moneymaker2_product_tabs[<?php echo $product_tab_row; ?>][link]" class="form-control">
															<option value="0"><?php echo $text_select ?></option>
															<?php foreach ($informations as $information) { ?>
															<option value="<?php echo $information['information_id']; ?>" <?php if ($information['information_id'] == $value['link']) { ?>selected="selected"<?php } ?>><?php echo $information['title'] ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_product_tabs_sort_order<?php echo $product_tab_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_product_tabs[<?php echo $product_tab_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_product_tabs_sort_order<?php echo $product_tab_row; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $product_tab_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_related; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_product_related_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_products_carousel; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_related_carousel" class="form-control">
											<?php if ($moneymaker2_product_related_carousel) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_related_carousel_autoplay" class="form-control">
											<?php if ($moneymaker2_product_related_carousel_autoplay) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_related_stock" class="form-control">
											<?php if ($moneymaker2_product_related_stock) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_related_code" class="form-control">
											<?php if ($moneymaker2_product_related_code) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
									<div class="col-sm-4">
										<select name="moneymaker2_product_related_description" class="form-control">
											<?php if ($moneymaker2_product_related_description) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							</div>
							<div class="tab-pane" id="tab_footer">
							<fieldset>
								<legend><?php echo $entry_tab_footer; ?></legend>
								<div class="form-group margin-top">
									<p class="col-sm-12"><?php echo $entry_footer_help; ?><br /></p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_footer_display_information; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_information_hide" value="0" <?php if (!$moneymaker2_footer_information_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_information_hide" value="1" <?php if ($moneymaker2_footer_information_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_footer_display_customer; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_customer_hide" value="0" <?php if (!$moneymaker2_footer_customer_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_customer_hide" value="1" <?php if ($moneymaker2_footer_customer_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_footer_display_extras; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_extras_hide" value="0" <?php if (!$moneymaker2_footer_extras_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_extras_hide" value="1" <?php if ($moneymaker2_footer_extras_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_footer_display_account; ?></label>
									<div class="col-sm-4">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_account_hide" value="0" <?php if (!$moneymaker2_footer_account_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_account_hide" value="1" <?php if ($moneymaker2_footer_account_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_background; ?></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_strip_bg_color" value="<?php echo $moneymaker2_footer_strip_bg_color; ?>" class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_border_strip; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_top_bg_color" value="<?php echo $moneymaker2_footer_top_bg_color; ?>" class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_background; ?> 1</small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_bottom_bg_color" value="<?php echo $moneymaker2_footer_bottom_bg_color; ?>" class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_background; ?> 2</small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_links; ?></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_links_font_color[0]" value="<?php echo $moneymaker2_footer_links_font_color[0]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_links_font_color[1]" value="<?php echo $moneymaker2_footer_links_font_color[1]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_hover; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_links_font_color[2]" value="<?php echo $moneymaker2_footer_links_font_color[2]; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_active; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_font_color; ?></label>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_text_font_color" value="<?php echo $moneymaker2_footer_text_font_color; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_static; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_text_font_color_h5" value="<?php echo $moneymaker2_footer_text_font_color_h5; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_header; ?></small></p>
									</div>
									<div class="col-sm-3">
										<input type="text" name="moneymaker2_footer_text_font_color_border" value="<?php echo $moneymaker2_footer_text_font_color_border; ?>"  class="form-control colorpicker" /><p class="text-center"><small><?php echo $entry_border_strip; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_contacts; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_contacts_enabled" value="1" <?php if ($moneymaker2_footer_contacts_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_contacts_enabled" value="0" <?php if (!$moneymaker2_footer_contacts_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_footer_contacts_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_footer_contacts_title[$language['language_id']]) ? $moneymaker2_footer_contacts_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_footer_contacts_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_footer_contacts_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_footer_contacts_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_contacts; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="row" id="vtab-footer_contacts">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="footer_contacts">
											<?php $footer_contact_row = 1; ?>
											<?php foreach ($moneymaker2_footer_contacts as $value) { ?>
											<li><a href="#tab-fcontact<?php echo $footer_contact_row; ?>" data-toggle="tab" id="link-fcontact<?php echo $footer_contact_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-fcontact<?php echo $footer_contact_row; ?>\']').parent().remove(); $('#tab-fcontact<?php echo $footer_contact_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $footer_contact_row; ?></a></li>
											<?php $footer_contact_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addFooterContact();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $footer_contact_row = 1; ?>
											<?php foreach ($moneymaker2_footer_contacts as $value) { ?>
											<div class="tab-pane" id="tab-fcontact<?php echo $footer_contact_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $footer_contact_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_footer_contacts[<?php echo $footer_contact_row; ?>][caption][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['caption'][$language['language_id']]) ? $value['caption'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_footer_contacts_link<?php echo $footer_contact_row; ?>"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_footer_contacts[<?php echo $footer_contact_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_contacts_link<?php echo $footer_contact_row; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_footer_contacts[<?php echo $footer_contact_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_footer_contacts_sort_order<?php echo $footer_contact_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_footer_contacts[<?php echo $footer_contact_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_contacts_sort_order<?php echo $footer_contact_row; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $footer_contact_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_links; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_links_enabled" value="1" <?php if ($moneymaker2_footer_links_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_links_enabled" value="0" <?php if (!$moneymaker2_footer_links_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_footer_links_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_footer_links_title[$language['language_id']]) ? $moneymaker2_footer_links_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_footer_links_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_footer_links_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_footer_links_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_links; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="row" id="vtab-footer_links">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="footer_links">
											<?php $footer_link_row = 1; ?>
											<?php foreach ($moneymaker2_footer_links as $value) { ?>
											<li><a href="#tab-flink<?php echo $footer_link_row; ?>" data-toggle="tab" id="link-flink<?php echo $footer_link_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-flink<?php echo $footer_link_row; ?>\']').parent().remove(); $('#tab-flink<?php echo $footer_link_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $footer_link_row; ?></a></li>
											<?php $footer_link_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addFooterLink();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $footer_link_row = 1; ?>
											<?php foreach ($moneymaker2_footer_links as $value) { ?>
											<div class="tab-pane" id="tab-flink<?php echo $footer_link_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $footer_link_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_footer_links[<?php echo $footer_link_row; ?>][caption][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['caption'][$language['language_id']]) ? $value['caption'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_footer_links_link<?php echo $footer_link_row; ?>"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_footer_links[<?php echo $footer_link_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" id="moneymaker2_footer_links_link<?php echo $footer_link_row; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_footer_links[<?php echo $footer_link_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_footer_links_sort_order<?php echo $footer_link_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_footer_links[<?php echo $footer_link_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_links_sort_order<?php echo $footer_link_row; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $footer_link_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_text; ?> I</legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_text1_enabled" value="1" <?php if ($moneymaker2_footer_text1_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_text1_enabled" value="0" <?php if (!$moneymaker2_footer_text1_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_footer_text1_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_footer_text1_title[$language['language_id']]) ? $moneymaker2_footer_text1_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_footer_text1_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_footer_text1_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_footer_text1_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="moneymaker2_footer_text1[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_footer_text1[$language['language_id']]) ? $moneymaker2_footer_text1[$language['language_id']] : ''; ?></textarea>
											<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
										</div>
										<?php } ?>
										<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_text; ?> II</legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_text2_enabled" value="1" <?php if ($moneymaker2_footer_text2_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_text2_enabled" value="0" <?php if (!$moneymaker2_footer_text2_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_footer_text2_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_footer_text2_title[$language['language_id']]) ? $moneymaker2_footer_text2_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-4">
										<?php $first = true; ?>
										<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_footer_text2_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_footer_text2_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_footer_text2_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="moneymaker2_footer_text2[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_footer_text2[$language['language_id']]) ? $moneymaker2_footer_text2[$language['language_id']] : ''; ?></textarea>
											<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
										</div>
										<?php } ?>
										<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_copyrights; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_footer_display_copyrights; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_copyrights_hide" value="0" <?php if (!$moneymaker2_footer_copyrights_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_copyrights_hide" value="1" <?php if ($moneymaker2_footer_copyrights_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_footer_display_powered; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_powered_hide" value="0" <?php if (!$moneymaker2_footer_powered_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_powered_hide" value="1" <?php if ($moneymaker2_footer_powered_hide) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_copyrights; ?> ></span> <?php echo $entry_custom; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_powered_custom_enabled" value="1" <?php if ($moneymaker2_footer_powered_custom_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_powered_custom_enabled" value="0" <?php if (!$moneymaker2_footer_powered_custom_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="moneymaker2_footer_powered_custom_text[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_footer_powered_custom_text[$language['language_id']]) ? $moneymaker2_footer_powered_custom_text[$language['language_id']] : ''; ?></textarea>
											<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
										</div>
										<?php } ?>
										<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
									<div class="col-sm-4">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="moneymaker2_footer_powered_custom_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_footer_powered_custom_title[$language['language_id']]) ? $moneymaker2_footer_powered_custom_title[$language['language_id']] : ''; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
									<label class="col-sm-2 control-label"><?php echo $entry_year_foundation; ?></label>
									<div class="col-sm-4">
										<input type="number" name="moneymaker2_footer_powered_custom_year" value="<?php echo isset($moneymaker2_footer_powered_custom_year) ? $moneymaker2_footer_powered_custom_year : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control" />
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_socials; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_socials_enabled" value="1" <?php if ($moneymaker2_footer_socials_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_socials_enabled" value="0" <?php if (!$moneymaker2_footer_socials_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_target_blank; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_socials_target_blank" value="1" <?php if ($moneymaker2_footer_socials_target_blank) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
										<label class="radio-inline"><input type="radio" name="moneymaker2_footer_socials_target_blank" value="0" <?php if (!$moneymaker2_footer_socials_target_blank) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><span class="text-muted"><?php echo $entry_socials; ?> ></span> <?php echo $button_add; ?></legend>
								<div class="row" id="vtab-footer_socials">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="footer_socials">
											<?php $footer_social_row = 1; ?>
											<?php foreach ($moneymaker2_footer_socials as $value) { ?>
											<li><a href="#tab-social<?php echo $footer_social_row; ?>" data-toggle="tab" id="link-social<?php echo $footer_social_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-social<?php echo $footer_social_row; ?>\']').parent().remove(); $('#tab-social<?php echo $footer_social_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $footer_social_row; ?></a></li>
											<?php $footer_social_row++; ?>
											<?php } ?>
											<li>
												<button type="button" onclick="addFooterSocial();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<?php $footer_social_row = 1; ?>
											<?php foreach ($moneymaker2_footer_socials as $value) { ?>
											<div class="tab-pane" id="tab-social<?php echo $footer_social_row; ?>">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<p><h4><?php echo $tab_data; ?> #<?php echo $footer_social_row; ?></h4></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
													<div class="col-sm-5">
														<?php $first = true; ?>
														<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($value['icon'] == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_footer_socials[<?php echo $footer_social_row; ?>][icon]"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_footer_socials[<?php echo $footer_social_row; ?>][icon]" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_footer_socials[<?php echo $footer_social_row; ?>][caption][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['caption'][$language['language_id']]) ? $value['caption'][$language['language_id']] : ''; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_footer_socials_link<?php echo $footer_social_row; ?>"><?php echo $button_link; ?></label>
													<div class="col-sm-10">
														<input type="text" name="moneymaker2_footer_socials[<?php echo $footer_social_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" id="moneymaker2_footer_socials_link<?php echo $footer_social_row; ?>" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>
													<div class="col-sm-10">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
															<input type="text" name="moneymaker2_footer_socials[<?php echo $footer_social_row; ?>][multilink][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" class="form-control">
														</div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="moneymaker2_footer_socials_sort_order<?php echo $footer_social_row; ?>"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-10">
														<input type="number" min="0" name="moneymaker2_footer_socials[<?php echo $footer_social_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_socials_sort_order<?php echo $footer_social_row; ?>" class="form-control">
													</div>
												</div>
											</div>
											<?php $footer_social_row++; ?>
											<?php } ?>
										</div>
									</div>
								</div>
							</fieldset>
							</div>
							<div class="tab-pane" id="tab_modules">
								<fieldset>
									<legend><?php echo $entry_tab_modules; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_tab_modules_help; ?><br /></p>
									</div>
								</fieldset>
								<div class="row" id="vtab-modules">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="modules">
											<li><a href="#tab-modules_native" data-toggle="tab"> <?php echo $entry_native; ?></a></li>
											<li><a href="#tab-modules_stickers" data-toggle="tab"> <?php echo $entry_tab_stickers; ?></a></li>
											<li><a href="#tab-modules_promo" data-toggle="tab"> <?php echo $entry_tab_promo; ?></a></li>
											<li><a href="#tab-modules_maskedinput" data-toggle="tab"> <?php echo $entry_input_mask; ?></a></li>
											<li><a href="#tab-modules_quickorder" data-toggle="tab"> <?php echo $entry_tab_quickorder; ?></a></li>
											<li><a href="#tab-modules_callback" data-toggle="tab"> <?php echo $entry_tab_callback; ?></a></li>
											<li><a href="#tab-modules_newsletter" data-toggle="tab"> <?php echo $entry_tab_newsletter; ?></a></li>
											<li><a href="#tab-modules_popup" data-toggle="tab"> <?php echo $entry_tab_popup; ?></a></li>
											<li><a href="#tab-modules_timer" data-toggle="tab"> <?php echo $entry_tab_timer; ?></a></li>
											<li><a href="#tab-modules_snow" data-toggle="tab"> <?php echo $entry_tab_snow; ?></a></li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<div class="tab-pane" id="tab-modules_native">
												<fieldset>
													<legend><?php echo $entry_native; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_native_help; ?><br /></p>
													</div>
													<legend class="text-center"><small><?php echo $entry_categories; ?></small></legend>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_common_custom_icons; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_categories_icons" class="form-control">
																<?php if ($moneymaker2_modules_categories_icons) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<br />

													<legend class="text-center"><small><?php echo $entry_bestseller; ?></small></legend>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_products_carousel; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_bestseller_carousel" class="form-control">
																<?php if ($moneymaker2_modules_bestseller_carousel) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_bestseller_carousel_autoplay" class="form-control">
																<?php if ($moneymaker2_modules_bestseller_carousel_autoplay) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_bestseller_stock" class="form-control">
																<?php if ($moneymaker2_modules_bestseller_stock) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_bestseller_code" class="form-control">
																<?php if ($moneymaker2_modules_bestseller_code) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_bestseller_description" class="form-control">
																<?php if ($moneymaker2_modules_bestseller_description) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<br />
													<legend class="text-center"><small><?php echo $entry_featured; ?></small></legend>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_products_carousel; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_featured_carousel" class="form-control">
																<?php if ($moneymaker2_modules_featured_carousel) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_featured_carousel_autoplay" class="form-control">
																<?php if ($moneymaker2_modules_featured_carousel_autoplay) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_featured_stock" class="form-control">
																<?php if ($moneymaker2_modules_featured_stock) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_featured_code" class="form-control">
																<?php if ($moneymaker2_modules_featured_code) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_featured_description" class="form-control">
																<?php if ($moneymaker2_modules_featured_description) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<br />
													<legend class="text-center"><small><?php echo $entry_latest; ?></small></legend>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_products_carousel; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_latest_carousel" class="form-control">
																<?php if ($moneymaker2_modules_latest_carousel) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_latest_carousel_autoplay" class="form-control">
																<?php if ($moneymaker2_modules_latest_carousel_autoplay) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_latest_stock" class="form-control">
																<?php if ($moneymaker2_modules_latest_stock) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_latest_code" class="form-control">
																<?php if ($moneymaker2_modules_latest_code) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_latest_description" class="form-control">
																<?php if ($moneymaker2_modules_latest_description) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<br />
													<legend class="text-center"><small><?php echo $entry_special; ?></small></legend>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_products_carousel; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_special_carousel" class="form-control">
																<?php if ($moneymaker2_modules_special_carousel) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_special_carousel_autoplay" class="form-control">
																<?php if ($moneymaker2_modules_special_carousel_autoplay) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_availability; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_special_stock" class="form-control">
																<?php if ($moneymaker2_modules_special_stock) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_product_code; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_special_code" class="form-control">
																<?php if ($moneymaker2_modules_special_code) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_display_description; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_special_description" class="form-control">
																<?php if ($moneymaker2_modules_special_description) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													</fieldset>
											</div>

											<div class="tab-pane" id="tab-modules_stickers">
												<fieldset>
													<legend><?php echo $entry_tab_stickers; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_stickers_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_mode" value="1" <?php if ($moneymaker2_modules_stickers_mode) { ?>checked="checked"<?php } ?> /> <?php echo $entry_text; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_mode" value="0" <?php if (!$moneymaker2_modules_stickers_mode) { ?>checked="checked"<?php } ?> /> <?php echo $entry_tooltip; ?> (<?php echo $entry_hover; ?>)</label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_background; ?> (<?php echo $entry_text; ?>)</label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_stickers_background" id="moneymaker2_modules_stickers_background" class="form-control">
																<?php if ($moneymaker2_modules_stickers_background) { ?>
																<option value="1" selected="selected"><?php echo $moneymaker2_bw_styles[1]; ?></option>
																<option value="0"><?php echo $moneymaker2_bw_styles[0]; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $moneymaker2_bw_styles[1]; ?></option>
																<option value="0" selected="selected"><?php echo $moneymaker2_bw_styles[0]; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_transparency"><?php echo $entry_opacity; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_stickers_transparency" id="moneymaker2_modules_stickers_transparency" class="form-control">
																<?php for ($j = 10; $j <= 95; $j=$j+5) {
													($moneymaker2_modules_stickers_transparency == $j) ? $active = 'selected' : $active = ''; ?>
																<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?>%</option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_size_catalog"><?php echo $entry_size; ?> (<?php echo $entry_tab_catalog; ?>)</label>
														<div class="col-sm-10">
															<div class="input-group">
																<div class="input-group-btn">
																	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#sizesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
																</div>
																<select id="moneymaker2_modules_stickers_size_catalog" name="moneymaker2_modules_stickers_size_catalog" class="form-control">
																	<?php foreach ($moneymaker2_stickers_sizes as $moneymaker2_stickers_size) { ?>
																	<option value="<?php echo $moneymaker2_stickers_size; ?>" <?php if ($moneymaker2_modules_stickers_size_catalog == $moneymaker2_stickers_size) { ?>selected="selected"<?php } ?>><?php echo $moneymaker2_stickers_size; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_size_product"><?php echo $entry_size; ?> (<?php echo $entry_tab_product; ?>)</label>
														<div class="col-sm-10">
															<div class="input-group">
																<div class="input-group-btn">
																	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#sizesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
																</div>
																<select id="moneymaker2_modules_stickers_size_product" name="moneymaker2_modules_stickers_size_product" class="form-control">
																	<?php foreach ($moneymaker2_stickers_sizes as $moneymaker2_stickers_size) { ?>
																	<option value="<?php echo $moneymaker2_stickers_size; ?>" <?php if ($moneymaker2_modules_stickers_size_product == $moneymaker2_stickers_size) { ?>selected="selected"<?php } ?>><?php echo $moneymaker2_stickers_size; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_stickers; ?> ></span> <?php echo $entry_specials; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_stickers_specials_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_specials_enabled" value="1" <?php if ($moneymaker2_modules_stickers_specials_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_specials_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_specials_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-5">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_specials_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_specials_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_specials_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
														<div class="col-sm-3">
															<input type="text" name="moneymaker2_modules_stickers_specials_color" value="<?php echo $moneymaker2_modules_stickers_specials_color; ?>"  class="form-control colorpicker" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_specials_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_specials_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_specials_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_specials_discount"><?php echo $entry_discount; ?></label>
														<div class="col-sm-5">
															<select id="moneymaker2_modules_stickers_specials_discount" name="moneymaker2_modules_stickers_specials_discount" class="form-control">
																<?php if ($moneymaker2_modules_stickers_specials_discount) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_specials_discount_mode"><?php echo $entry_mode; ?></label>
														<div class="col-sm-3">
															<select id="moneymaker2_modules_stickers_specials_discount_mode" name="moneymaker2_modules_stickers_specials_discount_mode" class="form-control">
																<?php if ($moneymaker2_modules_stickers_specials_discount_mode) { ?>
																<option value="1" selected="selected"><?php echo $entry_percentage; ?></option>
																<option value="0"><?php echo $entry_difference; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $entry_percentage; ?></option>
																<option value="0" selected="selected"><?php echo $entry_difference; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_stickers; ?> ></span> <?php echo $entry_popular; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_stickers_popular_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_popular_enabled" value="1" <?php if ($moneymaker2_modules_stickers_popular_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_popular_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_popular_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-5">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_popular_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_popular_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_popular_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
														<div class="col-sm-3">
															<input type="text" name="moneymaker2_modules_stickers_popular_color" value="<?php echo $moneymaker2_modules_stickers_popular_color; ?>"  class="form-control colorpicker" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_popular_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_popular_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_popular_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_popular_limit"><?php echo $entry_limit; ?></label>
														<div class="col-sm-5">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_stickers_popular_limit" value="<?php echo $moneymaker2_modules_stickers_popular_limit; ?>"  id="moneymaker2_modules_stickers_popular_limit" class="form-control">
																<span class="input-group-addon"><span class="lowercase"><?php echo $entry_views; ?></span></span>
															</div>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_stickers; ?> ></span> <?php echo $entry_rated; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_stickers_rated_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_rated_enabled" value="1" <?php if ($moneymaker2_modules_stickers_rated_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_rated_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_rated_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-5">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_rated_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_rated_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_rated_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
														<div class="col-sm-3">
															<input type="text" name="moneymaker2_modules_stickers_rated_color" value="<?php echo $moneymaker2_modules_stickers_rated_color; ?>"  class="form-control colorpicker" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_rated_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_rated_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_rated_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_rated_limit"><?php echo $entry_limit; ?></label>
														<div class="col-sm-5">
															<div class="input-group">
																<input type="number" min="1" max="5" name="moneymaker2_modules_stickers_rated_limit" value="<?php echo $moneymaker2_modules_stickers_rated_limit; ?>"  id="moneymaker2_modules_stickers_rated_limit" class="form-control">
																<span class="input-group-addon"><span class="lowercase"><?php echo $entry_rating; ?></span></span>
															</div>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_stickers; ?> ></span> <?php echo $entry_new; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_stickers_new_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_new_enabled" value="1" <?php if ($moneymaker2_modules_stickers_new_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_new_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_new_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-5">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_new_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_new_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_new_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
														<div class="col-sm-3">
															<input type="text" name="moneymaker2_modules_stickers_new_color" value="<?php echo $moneymaker2_modules_stickers_new_color; ?>"  class="form-control colorpicker" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_new_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_new_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_new_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_new_limit"><?php echo $entry_limit; ?></label>
														<div class="col-sm-5">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_stickers_new_limit" value="<?php echo $moneymaker2_modules_stickers_new_limit; ?>"  id="moneymaker2_modules_stickers_new_limit" class="form-control">
																<span class="input-group-addon"><span class="lowercase"><?php echo $entry_days; ?></span></span>
															</div>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_stickers; ?> ></span> <?php echo $entry_custom; ?> I</legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_customstickers_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_custom1_enabled" value="1" <?php if ($moneymaker2_modules_stickers_custom1_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_custom1_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_custom1_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-5">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_custom1_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_custom1_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_custom1_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
														<div class="col-sm-3">
															<input type="text" name="moneymaker2_modules_stickers_custom1_color" value="<?php echo $moneymaker2_modules_stickers_custom1_color; ?>"  class="form-control colorpicker" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_custom1_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_custom1_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_custom1_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_custom1_field"><?php echo $entry_field; ?></label>
														<div class="col-sm-5">
															<select name="moneymaker2_modules_stickers_custom1_field" id="moneymaker2_modules_stickers_custom1_field" class="form-control">
																<?php foreach ($moneymaker2_custom_fields as $moneymaker2_custom_field) { ?>
																<?php ($moneymaker2_custom_field ==  $moneymaker2_modules_stickers_custom1_field) ? $active = 'selected' : $active=''; ?>
																<option value="<?php echo $moneymaker2_custom_field; ?>" <?php echo $active; ?>><?php echo $moneymaker2_custom_field; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_stickers; ?> ></span> <?php echo $entry_custom; ?> II</legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_customstickers_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_custom2_enabled" value="1" <?php if ($moneymaker2_modules_stickers_custom2_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_custom2_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_custom2_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-5">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_custom2_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_custom2_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_custom2_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
														<label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
														<div class="col-sm-3">
															<input type="text" name="moneymaker2_modules_stickers_custom2_color" value="<?php echo $moneymaker2_modules_stickers_custom2_color; ?>"  class="form-control colorpicker" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_custom2_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_custom2_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_custom2_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="moneymaker2_modules_stickers_custom2_field"><?php echo $entry_field; ?></label>
														<div class="col-sm-5">
															<select name="moneymaker2_modules_stickers_custom2_field" id="moneymaker2_modules_stickers_custom2_field" class="form-control">
																<?php foreach ($moneymaker2_custom_fields as $moneymaker2_custom_field) { ?>
																<?php ($moneymaker2_custom_field ==  $moneymaker2_modules_stickers_custom2_field) ? $active = 'selected' : $active=''; ?>
																<option value="<?php echo $moneymaker2_custom_field; ?>" <?php echo $active; ?>><?php echo $moneymaker2_custom_field; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</fieldset>
											</div>

											<div class="tab-pane" id="tab-modules_promo">
												<fieldset>
													<legend><?php echo $entry_tab_promo; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_promo_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-6">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_promo_enabled" value="1" <?php if ($moneymaker2_modules_promo_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_promo_enabled" value="0" <?php if (!$moneymaker2_modules_promo_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>
														<div class="col-sm-6">
															<div class="input-group">
																<div class="input-group-btn">
																	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
																</div>
																<select name="moneymaker2_modules_promo_style" class="form-control">
																	<?php foreach ($moneymaker2_banners_styles as $moneymaker2_banners_style) { ?>
																	<?php ($moneymaker2_banners_style ==  $moneymaker2_modules_promo_style) ? $active = 'selected' : $active=''; ?>
																	<option value="<?php echo $moneymaker2_banners_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_style; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_promo; ?> ></span> <?php echo $entry_tab_sticker; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_promostickers_help; ?></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-10">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_promo_enabled" value="1" <?php if ($moneymaker2_modules_stickers_promo_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_stickers_promo_enabled" value="0" <?php if (!$moneymaker2_modules_stickers_promo_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
														<div class="col-sm-6">
															<?php $first = true; ?>
															<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?><?php if ($moneymaker2_modules_stickers_promo_icon == $moneymaker2_fa_icons[$j]) { ?><button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_modules_stickers_promo_icon"><i class="fa fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <span><?php echo $moneymaker2_fa_icons[$j]; ?></span></button><input type="hidden" name="moneymaker2_modules_stickers_promo_icon" value="<?php echo $moneymaker2_fa_icons[$j]; ?>" /><?php $first = false; ?><?php } ?><?php if (!$first) break; ?><?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-7">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_stickers_promo_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_stickers_promo_caption[$language['language_id']]) ? $moneymaker2_modules_stickers_promo_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
												</fieldset>
												<fieldset>
													<legend><span class="text-muted"><?php echo $entry_tab_promo; ?> ></span> <?php echo $button_add; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_promo_add_help; ?></p>
													</div>
													<div class="row" id="vtab-modules_promos">
														<div class="col-sm-2">
															<ul class="nav nav-pills nav-stacked" id="modules_promos">
																<?php $modules_promo_row = 1; ?>
																<?php foreach ($moneymaker2_modules_promos as $value) { ?>
																<li><a href="#tab-promo<?php echo $modules_promo_row; ?>" data-toggle="tab" id="link-promo<?php echo $modules_promo_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-promo<?php echo $modules_promo_row; ?>\']').parent().remove(); $('#tab-promo<?php echo $modules_promo_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#<?php echo $modules_promo_row; ?></a></li>
																<?php $modules_promo_row++; ?>
																<?php } ?>
																<li>
																	<button type="button" onclick="addModulesPromo();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
																</li>
															</ul>
														</div>
														<div class="col-sm-10">
															<div class="tab-content">
																<?php $modules_promo_row = 1; ?>
																<?php foreach ($moneymaker2_modules_promos as $value) { ?>
																<div class="tab-pane" id="tab-promo<?php echo $modules_promo_row; ?>">
																	<div class="form-group">
																		<div class="col-sm-offset-2 col-sm-10">
																			<p><h4><?php echo $tab_data; ?> #<?php echo $modules_promo_row; ?></h4></p>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
																		<div class="col-sm-10">
																			<a href="" id="moneymaker2_modules_promos_image_thumb<?php echo $modules_promo_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][image]" value="<?php echo $value['image']; ?>" id="moneymaker2_modules_promos_image_input<?php echo $modules_promo_row; ?>" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>
																		<div class="col-sm-10">
																			<div class="well well-sm">
																				<input type="hidden" name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][categories]" value="<?php echo ':'.implode('::',$moneymaker2_modules_promos[$modules_promo_row-1]['categories']).':'; ?>" />
																				<?php foreach ($categories as $category) { ?>
																				<div class="checkbox">
																					<label onclick="passCheckboxes($(this))">
																						<?php if (in_array($category['category_id'], $value['categories'])) { ?>
																						<div class="btn btn-sm btn-default active" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw fa-check"></i></div> <?php echo $category['name']; ?>
																						<?php } else { ?>
																						<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo $category['name']; ?>
																						<?php } ?>
																					</label>
																				</div>
																				<?php } ?>
																			</div>
																			<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label" for="moneymaker2_modules_promos_sort_order<?php echo $modules_promo_row; ?>"><?php echo $entry_sort_order; ?></label>
																		<div class="col-sm-10">
																			<input type="number" min="0" name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_modules_promos_sort_order<?php echo $modules_promo_row; ?>" class="form-control">
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
																		<div class="col-sm-10">
																			<?php foreach ($languages as $language) { ?>
																			<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																				<input type="text" name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?>" class="form-control">
																			</div>
																			<?php } ?>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label"><?php echo $entry_button_title; ?></label>
																		<div class="col-sm-10">
																			<?php foreach ($languages as $language) { ?>
																			<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																				<input type="text" name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['title'][$language['language_id']]) ? $value['title'][$language['language_id']] : ''; ?>" class="form-control">
																			</div>
																			<?php } ?>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label" for="moneymaker2_modules_promos_link<?php echo $modules_promo_row; ?>"><?php echo $button_link; ?></label>
																		<div class="col-sm-10">
																			<select name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][link]" class="form-control">
																				<option value="0"><?php echo $text_select ?></option>
																				<?php foreach ($informations as $information) { ?>
																				<option value="<?php echo $information['information_id']; ?>" <?php if ($information['information_id'] == $value['link']) { ?>selected="selected"<?php } ?>><?php echo $information['title'] ?></option>
																				<?php } ?>
																			</select>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
																		<div class="col-sm-10">
																			<?php foreach ($languages as $language) { ?>
																			<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																				<textarea name="moneymaker2_modules_promos[<?php echo $modules_promo_row; ?>][description][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"><?php echo isset($value['description'][$language['language_id']]) ? $value['description'][$language['language_id']] : ''; ?></textarea>
																			</div>
																			<?php } ?>
																		</div>
																	</div>
																</div>
																<?php $modules_promo_row++; ?>
																<?php } ?>
															</div>
														</div>
													</div>
												</fieldset>
											</div>

											<div class="tab-pane" id="tab-modules_maskedinput">
												<fieldset>
													<legend><?php echo $entry_input_mask; ?> (<?php echo $entry_tab_quickorder; ?>, <?php echo $entry_tab_callback; ?>)</legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_phone_mask_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_input_mask; ?></label>
														<div class="col-sm-4">
															<select name="moneymaker2_modules_quickorder_phone_mask_enabled" class="form-control">
																<?php if ($moneymaker2_modules_quickorder_phone_mask_enabled) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<div class="col-sm-4">
															<input type="text" name="moneymaker2_modules_quickorder_phone_mask" value="<?php echo $moneymaker2_modules_quickorder_phone_mask; ?>" class="form-control" />
														</div>
														<div class="clearfix"></div>
													</div>
												</fieldset>
											</div>

											<div class="tab-pane" id="tab-modules_quickorder">
												<fieldset>
													<legend><?php echo $entry_tab_quickorder; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_quickorder_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-9">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_enabled" value="1" <?php if ($moneymaker2_modules_quickorder_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_enabled" value="0" <?php if (!$moneymaker2_modules_quickorder_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_modules_quickorder_fill_email_help; ?>"><?php echo $entry_modules_quickorder_fill_email; ?></span></label>
														<div class="col-sm-3">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_hide_email" value="0" <?php if (!$moneymaker2_modules_quickorder_hide_email) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_hide_email" value="1" <?php if ($moneymaker2_modules_quickorder_hide_email) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
														<div class="col-sm-5">
															<input type="text" name="moneymaker2_modules_quickorder_recipient" value="<?php echo isset($moneymaker2_modules_quickorder_recipient)&&$moneymaker2_modules_quickorder_recipient ? $moneymaker2_modules_quickorder_recipient : $config_email; ?>" class="form-control" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_modules_quickorder_display_thumb; ?></label>
														<div class="col-sm-3">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_thumb" value="1" <?php if ($moneymaker2_modules_quickorder_display_thumb) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_thumb" value="0" <?php if (!$moneymaker2_modules_quickorder_display_thumb) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
														<label class="col-sm-3 control-label"><?php echo $entry_modules_quickorder_display_catalog; ?></label>
														<div class="col-sm-3">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_catalog" value="1" <?php if ($moneymaker2_modules_quickorder_display_catalog) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_catalog" value="0" <?php if (!$moneymaker2_modules_quickorder_display_catalog) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_modules_quickorder_display_popupcart; ?></label>
														<div class="col-sm-3">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_popupcart" value="1" <?php if ($moneymaker2_modules_quickorder_display_popupcart) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_popupcart" value="0" <?php if (!$moneymaker2_modules_quickorder_display_popupcart) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
														<label class="col-sm-3 control-label"><?php echo $entry_modules_quickorder_display_checkoutcart; ?></label>
														<div class="col-sm-3">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_checkoutcart" value="1" <?php if ($moneymaker2_modules_quickorder_display_checkoutcart) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_display_checkoutcart" value="0" <?php if (!$moneymaker2_modules_quickorder_display_checkoutcart) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_image_size; ?></label>
														<div class="col-sm-4">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_quickorder_image_width" value="<?php echo $moneymaker2_modules_quickorder_image_width; ?>" class="form-control">
																<span class="input-group-addon"><?php echo $entry_px; ?></span>
															</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_quickorder_image_height" value="<?php echo $moneymaker2_modules_quickorder_image_height; ?>" class="form-control">
																<span class="input-group-addon"><?php echo $entry_px; ?></span>
															</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_button_title; ?></label>
														<div class="col-sm-8">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_quickorder_button_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_quickorder_button_title[$language['language_id']]) ? $moneymaker2_modules_quickorder_button_title[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_tooltip; ?> (<?php echo $entry_tab_product; ?>)</label>
														<div class="col-sm-8">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_quickorder_button_tooltip[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_quickorder_button_tooltip[$language['language_id']]) ? $moneymaker2_modules_quickorder_button_tooltip[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_modules_quickorder_goal_google_help; ?>"><?php echo $entry_modules_goal_google; ?></span></label>
														<div class="col-sm-4">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_goal_google" value="1" <?php if ($moneymaker2_modules_quickorder_goal_google) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_goal_google" value="0" <?php if (!$moneymaker2_modules_quickorder_goal_google) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_modules_quickorder_goal_yandex_help; ?>"><?php echo $entry_modules_goal_yandex; ?></span></label>
														<div class="col-sm-4">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_goal_yandex" value="1" <?php if ($moneymaker2_modules_quickorder_goal_yandex) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_quickorder_goal_yandex" value="0" <?php if (!$moneymaker2_modules_quickorder_goal_yandex) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon">#</span>
																<input type="text" name="moneymaker2_modules_quickorder_goal_yandex_counter" value="<?php echo isset($moneymaker2_modules_quickorder_goal_yandex_counter) ? $moneymaker2_modules_quickorder_goal_yandex_counter : ''; ?>" placeholder="<?php echo $entry_modules_goal_yandex_counter; ?>" class="form-control" />
															</div>
														</div>
													</div>
												</fieldset>
											</div>

											<div class="tab-pane" id="tab-modules_callback">
												<fieldset>
													<legend><?php echo $entry_tab_callback; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_callback_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-6">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_enabled" value="1" <?php if ($moneymaker2_modules_callback_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_enabled" value="0" <?php if (!$moneymaker2_modules_callback_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_sender; ?></label>
														<div class="col-sm-8">
															<input type="text" name="moneymaker2_modules_callback_sender" value="<?php echo isset($moneymaker2_modules_callback_sender)&&$moneymaker2_modules_callback_sender ? $moneymaker2_modules_callback_sender : $config_email; ?>" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_recipient; ?></label>
														<div class="col-sm-8">
															<input type="text" name="moneymaker2_modules_callback_recipient" value="<?php echo isset($moneymaker2_modules_callback_recipient)&&$moneymaker2_modules_callback_recipient ? $moneymaker2_modules_callback_recipient : $config_email; ?>" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_header; ?></label>
														<div class="col-sm-8">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_callback_header[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_callback_header[$language['language_id']]) ? $moneymaker2_modules_callback_header[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-8">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_callback_caption[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_callback_caption[$language['language_id']]) ? $moneymaker2_modules_callback_caption[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_display_image; ?></label>
														<div class="col-sm-8">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_image" value="1" <?php if ($moneymaker2_modules_callback_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_image" value="0" <?php if (!$moneymaker2_modules_callback_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_image; ?></label>
														<div class="col-sm-8">
															<a href="" id="moneymaker2_modules_callback_image_src_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $moneymaker2_modules_callback_thumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_modules_callback_image_src" value="<?php echo $moneymaker2_modules_callback_image_src; ?>" id="moneymaker2_modules_callback_image_src_input" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_image_size; ?></label>
														<div class="col-sm-4">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_callback_thumbs_width" value="<?php echo $moneymaker2_modules_callback_thumbs_width; ?>" class="form-control">
																<span class="input-group-addon"><?php echo $entry_px; ?></span>
															</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_callback_thumbs_height" value="<?php echo $moneymaker2_modules_callback_thumbs_height; ?>" class="form-control">
																<span class="input-group-addon"><?php echo $entry_px; ?></span>
															</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_modules_callback_goal_google_help; ?>"><?php echo $entry_modules_goal_google; ?></span></label>
														<div class="col-sm-4">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_goal_google" value="1" <?php if ($moneymaker2_modules_callback_goal_google) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_goal_google" value="0" <?php if (!$moneymaker2_modules_callback_goal_google) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_modules_callback_goal_yandex_help; ?>"><?php echo $entry_modules_goal_yandex; ?></span></label>
														<div class="col-sm-4">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_goal_yandex" value="1" <?php if ($moneymaker2_modules_callback_goal_yandex) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_callback_goal_yandex" value="0" <?php if (!$moneymaker2_modules_callback_goal_yandex) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon">#</span>
																<input type="text" name="moneymaker2_modules_callback_goal_yandex_counter" value="<?php echo isset($moneymaker2_modules_callback_goal_yandex_counter) ? $moneymaker2_modules_callback_goal_yandex_counter : ''; ?>" placeholder="<?php echo $entry_modules_goal_yandex_counter; ?>" class="form-control" />
															</div>
														</div>
													</div>
												</fieldset>
											</div>
											<div class="tab-pane" id="tab-modules_newsletter">
												<fieldset>
													<legend><?php echo $entry_tab_newsletter; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_newsletter_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-6">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_newsletter_enabled" value="1" <?php if ($moneymaker2_modules_newsletter_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_newsletter_enabled" value="0" <?php if (!$moneymaker2_modules_newsletter_enabled) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_header; ?></label>
														<div class="col-sm-8">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="moneymaker2_modules_newsletter_header[<?php echo $language['language_id']; ?>]" value="<?php echo isset($moneymaker2_modules_newsletter_header[$language['language_id']]) ? $moneymaker2_modules_newsletter_header[$language['language_id']] : ''; ?>" class="form-control" />
															</div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-8">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
																<textarea name="moneymaker2_modules_newsletter_caption[<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($moneymaker2_modules_newsletter_caption[$language['language_id']]) ? $moneymaker2_modules_newsletter_caption[$language['language_id']] : ''; ?></textarea>
																<span class="input-group-addon"><span class="btn btn-sm btn-default showeditor"><i class="fa fa-pencil"></i></span></span>
															</div>
															<?php } ?>
															<p class="text-right"><small><?php echo $entry_showeditor_help; ?></small></p>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_display_image; ?></label>
														<div class="col-sm-8">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_newsletter_image" value="1" <?php if ($moneymaker2_modules_newsletter_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_newsletter_image" value="0" <?php if (!$moneymaker2_modules_newsletter_image) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_image; ?></label>
														<div class="col-sm-8">
															<a href="" id="moneymaker2_modules_newsletter_image_src_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $moneymaker2_modules_newsletter_thumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="moneymaker2_modules_newsletter_image_src" value="<?php echo $moneymaker2_modules_newsletter_image_src; ?>" id="moneymaker2_modules_newsletter_image_src_input" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $entry_image_size; ?></label>
														<div class="col-sm-4">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_newsletter_thumbs_width" value="<?php echo $moneymaker2_modules_newsletter_thumbs_width; ?>" class="form-control">
																<span class="input-group-addon"><?php echo $entry_px; ?></span>
															</div><p class="text-center"><small><?php echo $entry_width; ?></small></p>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_newsletter_thumbs_height" value="<?php echo $moneymaker2_modules_newsletter_thumbs_height; ?>" class="form-control">
																<span class="input-group-addon"><?php echo $entry_px; ?></span>
															</div><p class="text-center"><small><?php echo $entry_height; ?></small></p>
														</div>
													</div>
													
												</fieldset>
											</div>
											<div class="tab-pane" id="tab-modules_popup">
												<fieldset>
													<legend><?php echo $entry_tab_popup; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_popup_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-6">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_popup" value="1" <?php if ($moneymaker2_modules_popup) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_popup" value="0" <?php if (!$moneymaker2_modules_popup) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $button_link; ?></label>
														<div class="col-sm-8">
															<select name="moneymaker2_modules_popup_link" class="form-control">
																<option value="0"><?php echo $text_select ?></option>
																<option value="newsletter" <?php if ($moneymaker2_modules_popup_link=="newsletter") { ?>selected="selected"<?php } ?>><?php echo $entry_tab_modules; ?> > <?php echo $entry_tab_newsletter; ?></option>
																<?php foreach ($informations as $information) { ?>
																<option value="<?php echo $information['information_id']; ?>" <?php if ($information['information_id'] == $moneymaker2_modules_popup_link) { ?>selected="selected"<?php } ?>><?php echo $information['title'] ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="moneymaker2_modules_popup_delay"><?php echo $entry_delay; ?></label>
														<div class="col-sm-8">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_popup_delay" value="<?php echo $moneymaker2_modules_popup_delay; ?>"  id="moneymaker2_modules_popup_delay" class="form-control">
																<span class="input-group-addon"><span class="lowercase"><?php echo $entry_seconds; ?></span></span>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="moneymaker2_modules_popup_limit"><?php echo $entry_limit; ?></label>
														<div class="col-sm-8">
															<div class="input-group">
																<input type="number" min="1" name="moneymaker2_modules_popup_limit" value="<?php echo $moneymaker2_modules_popup_limit; ?>"  id="moneymaker2_modules_popup_limit" class="form-control">
																<span class="input-group-addon"><span class="lowercase"><?php echo $entry_days; ?></span></span>
															</div>
														</div>
													</div>
												</fieldset>
											</div>
											<div class="tab-pane" id="tab-modules_timer">
												<fieldset>
													<legend><?php echo $entry_tab_timer; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_timer_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-6">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_timer" value="1" <?php if ($moneymaker2_modules_timer) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_timer" value="0" <?php if (!$moneymaker2_modules_timer) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="moneymaker2_modules_timer_discount"><?php echo $entry_discount; ?></label>
														<div class="col-sm-3">
															<select id="moneymaker2_modules_timer_discount" name="moneymaker2_modules_timer_discount" class="form-control">
																<?php if ($moneymaker2_modules_timer_discount) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
																<?php } ?>
															</select>
														</div>
														<label class="col-sm-2 control-label" for="moneymaker2_modules_timer_discount_mode"><?php echo $entry_mode; ?></label>
														<div class="col-sm-3">
															<select id="moneymaker2_modules_timer_discount_mode" name="moneymaker2_modules_timer_discount_mode" class="form-control">
																<?php if ($moneymaker2_modules_timer_discount_mode) { ?>
																<option value="1" selected="selected"><?php echo $entry_percentage; ?></option>
																<option value="0"><?php echo $entry_difference; ?></option>
																<?php } else { ?>
																<option value="1"><?php echo $entry_percentage; ?></option>
																<option value="0" selected="selected"><?php echo $entry_difference; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
												</fieldset>
											</div>
											<div class="tab-pane" id="tab-modules_snow">
												<fieldset>
													<legend><?php echo $entry_tab_snow; ?></legend>
													<div class="form-group margin-top">
														<p class="col-sm-12"><?php echo $entry_modules_snow_help; ?><br /></p>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label"><?php echo $text_enabled; ?></label>
														<div class="col-sm-6">
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_snow" value="1" <?php if ($moneymaker2_modules_snow) { ?>checked="checked"<?php } ?> /> <?php echo $text_yes; ?></label>
															<label class="radio-inline"><input type="radio" name="moneymaker2_modules_snow" value="0" <?php if (!$moneymaker2_modules_snow) { ?>checked="checked"<?php } ?> /> <?php echo $text_no; ?></label>
														</div>
													</div>
												</fieldset>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab_help">
								<fieldset>
									<legend><?php echo $entry_tab_help; ?></legend>
									<div class="form-group margin-top">
										<p class="col-sm-12"><?php echo $entry_help_text; ?><br /></p>
									</div>
								</fieldset>
							</div>
						</div>
					</div>
				</form>

				<div class="modal fade" id="iconsModal" tabindex="-1" role="dialog" aria-labelledby="iconsModalLabel" data-name="">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">&nbsp;</h4>
							</div>
							<div class="modal-body">
								<?php $icons_headers = array(0, 1, 328, 343, 358, 371, 384, 388, 399, 410, 414, 427, 467, 516, 533, 669, 680, 700, 736); ?>
								<?php for ($j = 0; $j < count($moneymaker2_fa_icons); $j++) { ?>
								<?php if (in_array($j, $icons_headers)) { ?>
									<div class="row"><div class="col-sm-12"><br /><h2 class="text-center">
									<?php if ($j == 0) { ?>No Icon<?php } ?>
									<?php if ($j == 1) { ?>Web Applications<?php } ?>
									<?php if ($j == 328) { ?>Hands<?php } ?>
									<?php if ($j == 343) { ?>Transportation<?php } ?>
									<?php if ($j == 358) { ?>Gender<?php } ?>
									<?php if ($j == 371) { ?>File Types<?php } ?>
									<?php if ($j == 384) { ?>Spinners<?php } ?>
									<?php if ($j == 388) { ?>Form Controls<?php } ?>
									<?php if ($j == 399) { ?>Payments<?php } ?>
									<?php if ($j == 410) { ?>Charts<?php } ?>
									<?php if ($j == 414) { ?>Currencies<?php } ?>
									<?php if ($j == 427) { ?>Text Editor<?php } ?>
									<?php if ($j == 467) { ?>Directional<?php } ?>
									<?php if ($j == 516) { ?>Video Player<?php } ?>
									<?php if ($j == 533) { ?>Brands<?php } ?>
									<?php if ($j == 669) { ?>Medical<?php } ?>
									<?php if ($j == 680) { ?>New Icons (v.4.5)<?php } ?>
									<?php if ($j == 700) { ?>New Icons (v.4.6)<?php } ?>
									<?php if ($j == 736) { ?>New Icons (v.4.7)<?php } ?>
										</h2></div></div>
								<?php } ?>
								<div class="col-lg-2 col-md-3 col-sm-4"><div class="btn btn-block btn-default"><i class="fa fa-lg fa-<?php echo $moneymaker2_fa_icons[$j]; ?>"></i> <?php echo $moneymaker2_fa_icons[$j]; ?></div></div>
								<?php } ?>
								<div class="row"><div class="col-sm-12"><br /></div></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="stylesModal" tabindex="-1" role="dialog" aria-labelledby="stylesModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">&nbsp;</h4>
							</div>
							<div class="modal-body">
								<?php foreach ($moneymaker2_banners_styles as $value) { ?>
								<span class="btn {*disabled*} btn-lg btn-<?php echo $value; ?>"><?php echo $value; ?></span>&nbsp;
								<?php } ?>
								<p>&nbsp;</p>
								<p>*<?php echo $entry_style_help; ?></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="sizesModal" tabindex="-1" role="dialog" aria-labelledby="sizesModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">&nbsp;</h4>
							</div>
							<div class="modal-body">
								<?php foreach ($moneymaker2_stickers_sizes as $value) { ?>
								<span class="fa-stack fa-<?php echo $value; ?>">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-stack-1x fa-inverse"><?php echo $value; ?></i>
								</span> &nbsp;
								<?php } ?>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="animationsModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">&nbsp;</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-sm-12 text-center">
										<div id="animationSandbox"><?php echo $entry_animation; ?></div>
									</div>
									<div class="col-sm-12 text-center">
										<div class="input-group">
											<div class="input-group-btn">
												<button type="button" class="btn btn-default  js--triggerAnimation" ><i class="fa fa-fw fa-play-circle"></i></button>
											</div>
											<select class="form-control js--animations">
												<optgroup label="Bouncing Entrances">
													<option value="bounceIn">bounceIn</option>
													<option value="bounceInDown">bounceInDown</option>
													<option value="bounceInLeft">bounceInLeft</option>
													<option value="bounceInRight">bounceInRight</option>
													<option value="bounceInUp">bounceInUp</option>
												</optgroup>
												<optgroup label="Bouncing Exits">
													<option value="bounceOut">bounceOut</option>
													<option value="bounceOutDown">bounceOutDown</option>
													<option value="bounceOutLeft">bounceOutLeft</option>
													<option value="bounceOutRight">bounceOutRight</option>
													<option value="bounceOutUp">bounceOutUp</option>
												</optgroup>
												<optgroup label="Fading Entrances">
													<option value="fadeIn">fadeIn</option>
													<option value="fadeInDown">fadeInDown</option>
													<option value="fadeInDownBig">fadeInDownBig</option>
													<option value="fadeInLeft">fadeInLeft</option>
													<option value="fadeInLeftBig">fadeInLeftBig</option>
													<option value="fadeInRight">fadeInRight</option>
													<option value="fadeInRightBig">fadeInRightBig</option>
													<option value="fadeInUp">fadeInUp</option>
													<option value="fadeInUpBig">fadeInUpBig</option>
												</optgroup>
												<optgroup label="Fading Exits">
													<option value="fadeOut">fadeOut</option>
													<option value="fadeOutDown">fadeOutDown</option>
													<option value="fadeOutDownBig">fadeOutDownBig</option>
													<option value="fadeOutLeft">fadeOutLeft</option>
													<option value="fadeOutLeftBig">fadeOutLeftBig</option>
													<option value="fadeOutRight">fadeOutRight</option>
													<option value="fadeOutRightBig">fadeOutRightBig</option>
													<option value="fadeOutUp">fadeOutUp</option>
													<option value="fadeOutUpBig">fadeOutUpBig</option>
												</optgroup>
												<optgroup label="Flippers">
													<option value="flip">flip</option>
													<option value="flipInX">flipInX</option>
													<option value="flipInY">flipInY</option>
													<option value="flipOutX">flipOutX</option>
													<option value="flipOutY">flipOutY</option>
												</optgroup>
												<optgroup label="Lightspeed">
													<option value="lightSpeedIn">lightSpeedIn</option>
													<option value="lightSpeedOut">lightSpeedOut</option>
												</optgroup>
												<optgroup label="Rotating Entrances">
													<option value="rotateIn">rotateIn</option>
													<option value="rotateInDownLeft">rotateInDownLeft</option>
													<option value="rotateInDownRight">rotateInDownRight</option>
													<option value="rotateInUpLeft">rotateInUpLeft</option>
													<option value="rotateInUpRight">rotateInUpRight</option>
												</optgroup>
												<optgroup label="Rotating Exits">
													<option value="rotateOut">rotateOut</option>
													<option value="rotateOutDownLeft">rotateOutDownLeft</option>
													<option value="rotateOutDownRight">rotateOutDownRight</option>
													<option value="rotateOutUpLeft">rotateOutUpLeft</option>
													<option value="rotateOutUpRight">rotateOutUpRight</option>
												</optgroup>
												<optgroup label="Sliding Entrances">
													<option value="slideInUp">slideInUp</option>
													<option value="slideInDown">slideInDown</option>
													<option value="slideInLeft">slideInLeft</option>
													<option value="slideInRight">slideInRight</option>
												</optgroup>
												<optgroup label="Sliding Exits">
													<option value="slideOutUp">slideOutUp</option>
													<option value="slideOutDown">slideOutDown</option>
													<option value="slideOutLeft">slideOutLeft</option>
													<option value="slideOutRight">slideOutRight</option>
												</optgroup>
												<optgroup label="Zoom Entrances">
													<option value="zoomIn">zoomIn</option>
													<option value="zoomInDown">zoomInDown</option>
													<option value="zoomInLeft">zoomInLeft</option>
													<option value="zoomInRight">zoomInRight</option>
													<option value="zoomInUp">zoomInUp</option>
												</optgroup>
												<optgroup label="Zoom Exits">
													<option value="zoomOut">zoomOut</option>
													<option value="zoomOutDown">zoomOutDown</option>
													<option value="zoomOutLeft">zoomOutLeft</option>
													<option value="zoomOutRight">zoomOutRight</option>
													<option value="zoomOutUp">zoomOutUp</option>
												</optgroup>
												<optgroup label="Attention Seekers">
													<option value="bounce">bounce</option>
													<option value="flash">flash</option>
													<option value="pulse">pulse</option>
													<option value="rubberBand">rubberBand</option>
													<option value="shake">shake</option>
													<option value="swing">swing</option>
													<option value="tada">tada</option>
													<option value="wobble">wobble</option>
													<option value="jello">jello</option>
												</optgroup>
												<optgroup label="Specials">
													<option value="hinge">hinge</option>
													<option value="rollIn">rollIn</option>
													<option value="rollOut">rollOut</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<script type="text/javascript"><!--
		$('.input-group-addon .showeditor').click(function() {
			$(this).parent().parent().find('textarea').summernote({height: 100});
			$(this).parent().remove();
			$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');
		});

		$('#iconsModal').on('show.bs.modal', function (event) {
			var target = $(event.relatedTarget);
			var name = target.data('setting-name');
			$(this).attr( "data-name", name );
		});

		$( "#iconsModal .modal-body .btn.btn-block.btn-default" ).click(function() {
			var icon = $(this).children( ".fa" ).attr('class').split(' ');
			var name = $("#iconsModal").attr('data-name');
			$( "input[name='" + name + "']" ).attr('value', icon[2].replace("fa-", "") );
			var btnname = $('#iconsModal').attr( "data-name" );
			$( ".btn[data-setting-name='" + btnname + "'] span" ).text( icon[2].replace("fa-", "") )
			$( ".btn[data-setting-name='" + btnname + "'] i" ).removeClass();
			$( ".btn[data-setting-name='" + btnname + "'] i" ).addClass('fa fa-' + icon[2].replace("fa-", "") );
			$('#iconsModal').modal('hide')
		});

		$('.colorpicker').each(function(index) {
			$(this).attr('id', 'colorpicker_'+index );
			var colorpicker = new Array();
			colorpicker[index] = $('#colorpicker_'+index).val();
			$('#colorpicker_'+index).css('background-color', colorpicker[index]);

			$('#colorpicker_'+index).colpick({
				//layout:'rgbhex',
				layout:'full',
				submit:0,
				color: colorpicker[index],
				onChange:function(hsb,hex,rgb,el,bySetColor) {
					if(($('#colorpicker_'+index).attr('name') == 'moneymaker2_common_themes_color_primary')) {
						moneymaker2_color = {h: hsb['h'], s: hsb['s'], b: hsb['b']-15 >= 0 ? hsb['b']-15 : 0};
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_15]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_15]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s'], b: hsb['b']-10 >= 0 ? hsb['b']-10 : 0};
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_10]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_10]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s'], b: hsb['b']-5 >= 0 ? hsb['b']-5 : 0};
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_5]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_5]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s'], b: hsb['b']-30 >= 0 ? hsb['b']-30 : 0};
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_30]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_30]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s'], b: hsb['b']-17 >= 0 ? hsb['b']-17 : 0};
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_17]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_darken_17]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s']-16 >= 0 ? hsb['s']-16 : 0, b: hsb['b']+20 <= 100 ? hsb['b']+20 : 100};
						$('.colorpicker[name=moneymaker2_common_themes_color_lighten_20]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_lighten_20]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s']+3 <= 100 ? hsb['s']+3 : 100, b: hsb['b']+17 <= 100 ? hsb['b']+17 : 100};
						$('.colorpicker[name=moneymaker2_common_themes_color_lighten_17]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_lighten_17]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
						moneymaker2_color = {h: hsb['h'], s: hsb['s']-60 >= 0 ? hsb['s']-60 : 0, b: hsb['b']+25 <= 100 ? hsb['b']+25 : 100};
						$('.colorpicker[name=moneymaker2_common_themes_color_lighten_25]').css('background-color', '#' + $.colpick.hsbToHex(moneymaker2_color));
						$('.colorpicker[name=moneymaker2_common_themes_color_lighten_25]').val('#' + $.colpick.hsbToHex(moneymaker2_color));
					}
					if ($('#colorpicker_'+index+'[name*="moneymaker2_common_themes_color"]').length) {
						$('input[name=moneymaker2_common_themes_colors_changed]').val(1);
					}
					if(!bySetColor) {
						$(el).val('#'+hex);
						$('#colorpicker_'+index).val('#'+hex );
					}
					$(el).css('background-color','#'+hex);
					$('.colpick_current_color').css('display', 'visible' );
				}
			}).keyup(function(){
				$(this).colpickSetColor(this.value);
			});
		});

		$(".bs-slider").bootstrapSlider({
			tooltip: 'always',
			ticks: [1, 50, 100],
			ticks_labels: ['1%', '50%', '100%'],
			ticks_snap_bounds: 1
		});
		$('.slider.slider-horizontal .tooltip-main').css({'margin-left': '-14px'});
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			$('.bs-slider').bootstrapSlider('relayout');
		});

		$('#tabs a:first').tab('show')
		$('#header_contacts a:first').tab('show');
		$('#header_banners a:first').tab('show');
		$('#header_panelbanners a:first').tab('show');
		$('#header_panellinks a:first').tab('show');
		$('#header_links a:first').tab('show');
		$('#footer_contacts a:first').tab('show');
		$('#footer_links a:first').tab('show');
		$('#footer_socials a:first').tab('show');
		$('#product_points a:first').tab('show');
		$('#product_stock_points a:first').tab('show');
		$('#product_tabs a:first').tab('show');
		$('#modules_promos a:first').tab('show');
		$('#categories_advantages a:first').tab('show');
		$('#categories_advantageslinks a:first').tab('show');
		$('#catalog_compare_charts a:first').tab('show');
		$('#modules a:first').tab('show');

		var header_contact_row = <?php echo $header_contact_row; ?>;
		function addHeaderContact() {
			html = '<div class="tab-pane active" id="tab-contact' + header_contact_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + header_contact_row + '</h4></p>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_mode; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<select name="moneymaker2_header_contacts[' + header_contact_row + '][mode]" class="form-control">';
			html += '<option value="0" selected="selected"><?php echo $text_select ?></option>';
			<?php foreach ($moneymaker2_contacts_modes as $key => $value) { ?>
			html += '<option value="<?php echo $key; ?>"><?php echo $value; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>';
			html += '<div class="col-sm-3">';
			html += '<a href="" id="moneymaker2_header_contacts_image_thumb' + header_contact_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="moneymaker2_header_contacts[' + header_contact_row + '][image]" value="" id="moneymaker2_header_contacts_image_input' + header_contact_row + '" />';
			html += '</div>';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_contacts[' + header_contact_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_header_contacts[' + header_contact_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_contacts[' + header_contact_row + '][text][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_contacts_link' + header_contact_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_header_contacts[' + header_contact_row + '][link]" value="" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_contacts_link' + header_contact_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_contacts[' + header_contact_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_contacts_sort_order' + header_contact_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_header_contacts[' + header_contact_row + '][sort_order]" value="' + header_contact_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_contacts_sort_order' + header_contact_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-header_contacts .tab-content').append(html);
			$('#header_contacts li .btn-success').parent().before('<li><a href="#tab-contact' + header_contact_row + '" data-toggle="tab" id="link-contact' + header_contact_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-contact' + header_contact_row + '\').parent().remove(); $(\'#tab-contact' + header_contact_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + header_contact_row + '</a></li>');

			$('#link-contact' + header_contact_row).trigger('click');
			header_contact_row++;
		}

		var header_banner_row = <?php echo $header_banner_row; ?>;
		function addHeaderBanner() {
			html = '<div class="tab-pane active" id="tab-banner' + header_banner_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + header_banner_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<a href="" id="moneymaker2_header_banners_image_thumb' + header_banner_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="moneymaker2_header_banners[' + header_banner_row + '][image]" value="" id="moneymaker2_header_banners_image_input' + header_banner_row + '" />';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_banners[' + header_banner_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_header_banners[' + header_banner_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<div class="input-group">';
			html += '<div class="input-group-btn">';
			html += '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>';
			html += '</div>';
			html += '<select name="moneymaker2_header_banners[' + header_banner_row + '][style]" class="form-control">';
			<?php foreach ($moneymaker2_banners_styles as $key => $value) { ?>
			html += '<option value="<?php echo $value; ?>" <?php if ($key == 0) { ?>selected<?php } ?>><?php echo $value; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_banners[' + header_banner_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea name="moneymaker2_header_banners[' + header_banner_row + '][text][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_banners_link' + header_banner_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_header_banners[' + header_banner_row + '][link]" value="" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_banners_link' + header_banner_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_banners[' + header_banner_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_banners_sort_order' + header_banner_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_header_banners[' + header_banner_row + '][sort_order]" value="1" id="moneymaker2_header_banners_sort_order' + header_banner_row + '" class="form-control"><p class="text-right"><?php echo $entry_header_categories_banners_sort_order_help; ?></p>';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-header_banners .tab-content').append(html);
			$('#header_banners li .btn-success').parent().before('<li><a href="#tab-banner' + header_banner_row + '" data-toggle="tab" id="link-banner' + header_banner_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-banner' + header_banner_row + '\').parent().remove(); $(\'#tab-banner' + header_banner_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + header_banner_row + '</a></li>');

			$('#link-banner' + header_banner_row).trigger('click');
			<?php foreach ($languages as $language) { ?>
				$('textarea[name="moneymaker2_header_banners[' + header_banner_row + '][text][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
			<?php } ?>
			$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

			header_banner_row++;
		}

		var header_panelbanner_row = <?php echo $header_panelbanner_row; ?>;
		function addHeaderPanelbanner() {
			html = '<div class="tab-pane active" id="tab-panelbanner' + header_panelbanner_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + header_panelbanner_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<a href="" id="moneymaker2_header_panelbanners_image_thumb' + header_panelbanner_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][image]" value="" id="moneymaker2_header_panelbanners_image_input' + header_panelbanner_row + '" />';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<div class="input-group">';
			html += '<div class="input-group-btn">';
			html += '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>';
			html += '</div>';
			html += '<select name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][style]" class="form-control">';
			<?php foreach ($moneymaker2_banners_styles as $key => $value) { ?>
			html += '<option value="<?php echo $value; ?>" <?php if ($key == 0) { ?>selected<?php } ?>><?php echo $value; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][text][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_panelbanners_link' + header_panelbanner_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][link]" value="" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_panelbanners_link' + header_panelbanner_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_panelbanners_sort_order' + header_panelbanner_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<input type="number" min="0" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][sort_order_outer]" value="1" class="form-control"><p class="text-center"><small><?php echo $entry_header_categories_banners_outer_sort_order_help; ?></small></p>';
			html += '</div>';
			html += '<div class="col-sm-5">';
			html += '<input type="number" min="0" name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][sort_order]" value="1" class="form-control"><p class="text-center"><small><?php echo $entry_header_categories_banners_sort_order_help; ?></small></p>';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-header_panelbanners .tab-content').append(html);
			$('#header_panelbanners li .btn-success').parent().before('<li><a href="#tab-panelbanner' + header_panelbanner_row + '" data-toggle="tab" id="link-panelbanner' + header_panelbanner_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-panelbanner' + header_panelbanner_row + '\').parent().remove(); $(\'#tab-panelbanner' + header_panelbanner_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + header_panelbanner_row + '</a></li>');

			$('#link-panelbanner' + header_panelbanner_row).trigger('click');
			<?php foreach ($languages as $language) { ?>
				$('textarea[name="moneymaker2_header_panelbanners[' + header_panelbanner_row + '][text][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
			<?php } ?>
			$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

			header_panelbanner_row++;
		}

		var header_link_row = <?php echo $header_link_row; ?>;
		function addHeaderLink() {
			html = '<div class="tab-pane active" id="tab-hlink' + header_link_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + header_link_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_links[' + header_link_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_header_links[' + header_link_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_links[' + header_link_row + '][caption][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_header_links[' + header_link_row + '][link]" value="" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_links[' + header_link_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_links_sort_order' + header_link_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_header_links[' + header_link_row + '][sort_order]" value="' + header_link_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_links_sort_order' + header_link_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-header_links .tab-content').append(html);
			$('#header_links li .btn-success').parent().before('<li><a href="#tab-hlink' + header_link_row + '" data-toggle="tab" id="link-hlink' + header_link_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-hlink' + header_link_row + '\').parent().remove(); $(\'#tab-hlink' + header_link_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + header_link_row + '</a></li>');
			$('#link-hlink' + header_link_row).trigger('click');
			header_link_row++;
		}

		var header_panellink_row = <?php echo $header_panellink_row; ?>;
		function addHeaderPanelLink() {
			html = '<div class="tab-pane active" id="tab-hpanellink' + header_panellink_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + header_panellink_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_header_panellinks[' + header_panellink_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_header_panellinks[' + header_panellink_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_panellinks[' + header_panellink_row + '][caption][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_header_panellinks[' + header_panellink_row + '][link]" value="" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_header_panellinks[' + header_panellink_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_header_panellinks_sort_order' + header_panellink_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_header_panellinks[' + header_panellink_row + '][sort_order]" value="' + header_panellink_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_header_panellinks_sort_order' + header_panellink_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-header_panellinks .tab-content').append(html);
			$('#header_panellinks li .btn-success').parent().before('<li><a href="#tab-hpanellink' + header_panellink_row + '" data-toggle="tab" id="link-hpanellink' + header_panellink_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-hpanellink' + header_panellink_row + '\').parent().remove(); $(\'#tab-hpanellink' + header_panellink_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + header_panellink_row + '</a></li>');
			$('#link-hpanellink' + header_panellink_row).trigger('click');
			header_panellink_row++;
		}

		var categories_advantageslink_row = <?php echo $categories_advantageslink_row; ?>;
		function addCategoriesAdvantagesLink() {
			html = '<div class="tab-pane active" id="tab-cadvantagelink' + categories_advantageslink_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + categories_advantageslink_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_categories_advantageslinks[' + categories_advantageslink_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_categories_advantageslinks[' + categories_advantageslink_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_categories_advantageslinks[' + categories_advantageslink_row + '][caption][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_categories_advantageslinks[' + categories_advantageslink_row + '][link]" value="" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_categories_advantageslinks[' + categories_advantageslink_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_categories_advantageslinks_sort_order' + categories_advantageslink_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_categories_advantageslinks[' + categories_advantageslink_row + '][sort_order]" value="' + categories_advantageslink_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_categories_advantageslinks_sort_order' + categories_advantageslink_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-categories_advantageslinks .tab-content').append(html);
			$('#categories_advantageslinks li .btn-success').parent().before('<li><a href="#tab-cadvantagelink' + categories_advantageslink_row + '" data-toggle="tab" id="link-cadvantagelink' + categories_advantageslink_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-cadvantagelink' + categories_advantageslink_row + '\').parent().remove(); $(\'#tab-cadvantagelink' + categories_advantageslink_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + categories_advantageslink_row + '</a></li>');
			$('#link-cadvantagelink' + categories_advantageslink_row).trigger('click');
			categories_advantageslink_row++;
		}

		var footer_contact_row = <?php echo $footer_contact_row; ?>;
		function addFooterContact() {
			html = '<div class="tab-pane active" id="tab-fcontact' + footer_contact_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + footer_contact_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_footer_contacts[' + footer_contact_row + '][caption][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_footer_contacts_link' + footer_contact_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_footer_contacts[' + footer_contact_row + '][link]" value="" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_contacts_link' + footer_contact_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_footer_contacts[' + footer_contact_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_footer_contacts_sort_order' + footer_contact_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_footer_contacts[' + footer_contact_row + '][sort_order]" value="' + footer_contact_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_contacts_sort_order' + footer_contact_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-footer_contacts .tab-content').append(html);
			$('#footer_contacts li .btn-success').parent().before('<li><a href="#tab-fcontact' + footer_contact_row + '" data-toggle="tab" id="link-fcontact' + footer_contact_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-fcontact' + footer_contact_row + '\').parent().remove(); $(\'#tab-fcontact' + footer_contact_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + footer_contact_row + '</a></li>');

			$('#link-fcontact' + footer_contact_row).trigger('click');

			footer_contact_row++;
		}

		var footer_link_row = <?php echo $footer_link_row; ?>;
		function addFooterLink() {
			html = '<div class="tab-pane active" id="tab-flink' + footer_link_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + footer_link_row + '</h4></p>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_footer_links[' + footer_link_row + '][caption][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_footer_links_link' + footer_link_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_footer_links[' + footer_link_row + '][link]" value="http://" id="moneymaker2_footer_links_link' + footer_link_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_footer_links[' + footer_link_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_footer_links_sort_order' + footer_link_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_footer_links[' + footer_link_row + '][sort_order]" value="' + footer_link_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_links_sort_order' + footer_link_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-footer_links .tab-content').append(html);
			$('#footer_links li .btn-success').parent().before('<li><a href="#tab-flink' + footer_link_row + '" data-toggle="tab" id="link-flink' + footer_link_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-flink' + footer_link_row + '\').parent().remove(); $(\'#tab-flink' + footer_link_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + footer_link_row + '</a></li>');

			$('#link-flink' + footer_link_row).trigger('click');

			footer_link_row++;
		}

		var footer_social_row = <?php echo $footer_social_row; ?>;
		function addFooterSocial() {
			html = '<div class="tab-pane active" id="tab-social' + footer_social_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + footer_social_row + '</h4></p>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_footer_socials[' + footer_social_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_footer_socials[' + footer_social_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_footer_socials[' + footer_social_row + '][caption][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_footer_socials_link' + footer_social_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="moneymaker2_footer_socials[' + footer_social_row + '][link]" value="http://" id="moneymaker2_footer_socials_link' + footer_social_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<b class="lowercase"><?php echo $entry_multilanguage; ?></b>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_footer_socials[' + footer_social_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_footer_socials_sort_order' + footer_social_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_footer_socials[' + footer_social_row + '][sort_order]" value="' + footer_social_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_footer_socials_sort_order' + footer_social_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-footer_socials .tab-content').append(html);
			$('#footer_socials li .btn-success').parent().before('<li><a href="#tab-social' + footer_social_row + '" data-toggle="tab" id="link-social' + footer_social_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-social' + footer_social_row + '\').parent().remove(); $(\'#tab-social' + footer_social_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + footer_social_row + '</a></li>');

			$('#link-social' + footer_social_row).trigger('click');

			footer_social_row++;
		}

		var product_point_row = <?php echo $product_point_row; ?>;
		function addProductPoint() {
			html = '<div class="tab-pane active" id="tab-point' + product_point_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + product_point_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
			html += '<div class="col-sm-5">';
			html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_product_points[' + product_point_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
			html += '<input type="hidden" name="moneymaker2_product_points[' + product_point_row + '][icon]" value="-" />';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<div class="well well-sm">';
			html += '<input type="hidden" name="moneymaker2_product_points[' + product_point_row + '][categories]" value="" />';
			<?php foreach ($categories as $category) { ?>
			html += '<div class="checkbox">';
			html += '<label onclick="passCheckboxes($(this))">';
			html += '<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo addslashes($category['name']); ?>';
			html += '</label>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_product_points[' + product_point_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea name="moneymaker2_product_points[' + product_point_row + '][text][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_product_points_sort_order' + product_point_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_product_points[' + product_point_row + '][sort_order]" value="' + product_point_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_product_points_sort_order' + product_point_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-product_points .tab-content').append(html);
			$('#product_points li .btn-success').parent().before('<li><a href="#tab-point' + product_point_row + '" data-toggle="tab" id="link-point' + product_point_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-point' + product_point_row + '\').parent().remove(); $(\'#tab-point' + product_point_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + product_point_row + '</a></li>');

			$('#link-point' + product_point_row).trigger('click');
			<?php foreach ($languages as $language) { ?>
				$('textarea[name="moneymaker2_product_points[' + product_point_row + '][text][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
			<?php } ?>

			product_point_row++;
		}

		var product_tab_row = <?php echo $product_tab_row; ?>;
		function addProductTab() {
			html = '<div class="tab-pane active" id="tab-tab' + product_tab_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + product_tab_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<div class="well well-sm">';
			html += '<input type="hidden" name="moneymaker2_product_tabs[' + product_tab_row + '][categories]" value="" />';
		<?php foreach ($categories as $category) { ?>
				html += '<div class="checkbox">';
				html += '<label onclick="passCheckboxes($(this))">';
				html += '<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo addslashes($category['name']); ?>';
				html += '</label>';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>';
			html += '<div class="col-sm-10">';
		<?php foreach ($languages as $language) { ?>
				html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
				html += '<input type="text" name="moneymaker2_product_tabs[' + product_tab_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<select name="moneymaker2_product_tabs[' + product_tab_row + '][link]" class="form-control">';
			html += '<option value="0" selected><?php echo $text_select ?></option>';
		<?php foreach ($informations as $information) { ?>
				html += '<option value="<?php echo $information['information_id']; ?>"><?php echo addslashes($information['title']); ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_product_tabs_sort_order' + product_tab_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_product_tabs[' + product_tab_row + '][sort_order]" value="' + product_tab_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_product_tabs_sort_order' + product_tab_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-product_tabs .tab-content').append(html);
			$('#product_tabs li .btn-success').parent().before('<li><a href="#tab-tab' + product_tab_row + '" data-toggle="tab" id="link-tab' + product_tab_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-tab' + product_tab_row + '\').parent().remove(); $(\'#tab-tab' + product_tab_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + product_tab_row + '</a></li>');

			$('#link-tab' + product_tab_row).trigger('click');

			product_tab_row++;
		}

		var modules_promo_row = <?php echo $modules_promo_row; ?>;
		function addModulesPromo() {
			html = '<div class="tab-pane active" id="tab-promo' + modules_promo_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $tab_data; ?> #' + modules_promo_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<a href="" id="moneymaker2_modules_promos_image_thumb' + modules_promo_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="moneymaker2_modules_promos[' + modules_promo_row + '][image]" value="" id="moneymaker2_modules_promos_image_input' + modules_promo_row + '" />';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<div class="well well-sm">';
			html += '<input type="hidden" name="moneymaker2_modules_promos[' + modules_promo_row + '][categories]" value="" />';
		<?php foreach ($categories as $category) { ?>
				html += '<div class="checkbox">';
				html += '<label onclick="passCheckboxes($(this))">';
				html += '<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo addslashes($category['name']); ?>';
				html += '</label>';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_modules_promos_sort_order' + modules_promo_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="moneymaker2_modules_promos[' + modules_promo_row + '][sort_order]" value="' + modules_promo_row + '" placeholder="<?php echo $entry_optional; ?>" id="moneymaker2_modules_promos_sort_order' + modules_promo_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_modules_promos[' + modules_promo_row + '][text][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_button_title; ?></label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_modules_promos[' + modules_promo_row + '][title][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="moneymaker2_modules_promos_link' + modules_promo_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<select name="moneymaker2_modules_promos[' + modules_promo_row + '][link]" class="form-control">';
			html += '<option value="0" selected><?php echo $text_select ?></option>';
			<?php foreach ($informations as $information) { ?>
			html += '<option value="<?php echo $information['information_id']; ?>"><?php echo addslashes($information['title']); ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>';
			html += '<div class="col-sm-10">';
		<?php foreach ($languages as $language) { ?>
				html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
				html += '<textarea name="moneymaker2_modules_promos[' + modules_promo_row + '][description][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"></textarea>';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-modules_promos .tab-content').append(html);
			$('#modules_promos li .btn-success').parent().before('<li><a href="#tab-promo' + modules_promo_row + '" data-toggle="tab" id="link-promo' + modules_promo_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-promo' + modules_promo_row + '\').parent().remove(); $(\'#tab-promo' + modules_promo_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + modules_promo_row + '</a></li>');

			$('#link-promo' + modules_promo_row).trigger('click');

			modules_promo_row++;
		}

	var categories_advantage_row = <?php echo $categories_advantage_row; ?>;
	function addCategoriesAdvantage() {
		html = '<div class="tab-pane active" id="tab-cadvantage' + categories_advantage_row + '">';
		html += '<div class="form-group">';
		html += '<div class="col-sm-offset-2 col-sm-10">';
		html += '<p><h4><?php echo $tab_data; ?> #' + categories_advantage_row + '</h4></p>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
		html += '<div class="col-sm-5">';
		html += '<button type="button" class="btn btn-block btn-default" data-toggle="modal" data-target="#iconsModal" data-setting-name="moneymaker2_categories_advantages[' + categories_advantage_row + '][icon]"><i class="fa fa-"></i> <span>-</span></button>';
		html += '<input type="hidden" name="moneymaker2_categories_advantages[' + categories_advantage_row + '][icon]" value="-" />';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_categories; ?> (<?php echo $entry_pages; ?>)</label>';
		html += '<div class="col-sm-10">';
		html += '<div class="well well-sm">';
		html += '<input type="hidden" name="moneymaker2_categories_advantages[' + categories_advantage_row + '][categories]" value="" />';
		html += '<div class="checkbox">';
		html += '<label onclick="passCheckboxes($(this))">';
		html += '<div class="btn btn-sm btn-default" data-value="home"><i class="fa fa-fw"></i></div> <?php echo $entry_home_page; ?>';
		html += '</label>';
		html += '</div>';
	<?php foreach ($categories as $category) { ?>
			html += '<div class="checkbox">';
			html += '<label onclick="passCheckboxes($(this))">';
			html += '<div class="btn btn-sm btn-default" data-value="<?php echo $category['category_id']; ?>"><i class="fa fa-fw"></i></div> <?php echo addslashes($category['name']); ?>';
			html += '</label>';
			html += '</div>';
		<?php } ?>
		html += '</div>';
		html += '<a onclick="selectCheckboxes($(this))"><?php echo $text_select_all; ?></a> / <a onclick="unselectCheckboxes($(this))"><?php echo $text_unselect_all; ?></a>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_header; ?></label>';
		html += '<div class="col-sm-10">';
	<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_categories_advantages[' + categories_advantage_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control">';
			html += '</div>';
		<?php } ?>
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label" for="moneymaker2_categories_advantages_link' + categories_advantage_row + '"><?php echo $button_link; ?></label>';
		html += '<div class="col-sm-10">';
		html += '<select name="moneymaker2_categories_advantages[' + categories_advantage_row + '][link]" class="form-control">';
		html += '<option value="0" selected><?php echo $text_select ?></option>';
	<?php foreach ($informations as $information) { ?>
			html += '<option value="<?php echo $information['information_id']; ?>"><?php echo addslashes($information['title']); ?></option>';
		<?php } ?>
		html += '</select>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_style; ?></label>';
		html += '<div class="col-sm-10">';
		html += '<div class="input-group">';
		html += '<div class="input-group-btn">';
		html += '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>';
		html += '</div>';
		html += '<select name="moneymaker2_categories_advantages[' + categories_advantage_row + '][style]" class="form-control">';
	<?php foreach ($moneymaker2_banners_styles as $key => $value) { ?>
			html += '<option value="<?php echo $value; ?>" <?php if ($key == 0) { ?>selected<?php } ?>><?php echo $value; ?></option>';
		<?php } ?>
		html += '</select>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		$('#vtab-categories_advantages .tab-content').append(html);
		$('#categories_advantages li .btn-success').parent().before('<li><a href="#tab-cadvantage' + categories_advantage_row + '" data-toggle="tab" id="link-cadvantage' + categories_advantage_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-cadvantage' + categories_advantage_row + '\').parent().remove(); $(\'#tab-cadvantage' + categories_advantage_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + categories_advantage_row + '</a></li>');

		$('#link-cadvantage' + categories_advantage_row).trigger('click');
	<?php foreach ($languages as $language) { ?>
			$('textarea[name="moneymaker2_categories_advantages[' + categories_advantage_row + '][text][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
		<?php } ?>

		categories_advantage_row++;
	}

	var catalog_compare_chart_row = <?php echo $catalog_compare_chart_row; ?>;
	function addCatalogCompareChart() {
		html = '<div class="tab-pane active" id="tab-catalog_compare_chart' + catalog_compare_chart_row + '">';
		html += '<div class="form-group">';
		html += '<div class="col-sm-offset-2 col-sm-10">';
		html += '<p><h4><?php echo $tab_data; ?> #' + catalog_compare_chart_row + '</h4></p>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_mode; ?></label>';
		html += '<div class="col-sm-10">';
		html += '<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts[' + catalog_compare_chart_row + '][mode]" value="0"  /> <?php echo $entry_chart_line; ?></label>';
		html += '<label class="radio-inline"><input type="radio" name="moneymaker2_catalog_compare_charts[' + catalog_compare_chart_row + '][mode]" value="1" checked="checked" /> <?php echo $entry_chart_bar; ?></label>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_catalog_compare_chart_functions; ?></label>';
		html += '<div class="col-sm-4">';
		html += '<select name="moneymaker2_catalog_compare_charts[' + catalog_compare_chart_row + '][fns]" class="form-control">';
	<?php for ($j = 1; $j <= 5; $j++) { ?>
			html += '<option value="<?php echo $j; ?>" <?php if ($j==1) echo "selected"; ?>><?php echo $j; ?></option>';
		<?php } ?>
		html += '</select>';
		html += '</div>';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_delimiter; ?></label>';
		html += '<div class="col-sm-4">';
		html += '<select name="moneymaker2_catalog_compare_charts[' + catalog_compare_chart_row + '][delimiter]" class="form-control">';
		html += '<option value="0" selected><?php echo $text_select ?></option>';
		<?php foreach ($moneymaker2_delimiters as $moneymaker2_delimiter) { ?>
		html += '<option value="<?php echo $moneymaker2_delimiter; ?>"><?php echo $moneymaker2_delimiter; ?></option>';
		<?php } ?>
		html += '</select>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_attribute; ?></label>';
		html += '<div class="col-sm-10">';
		html += '<select name="moneymaker2_catalog_compare_charts[' + catalog_compare_chart_row + '][attribute]" class="form-control">';
		html += '<option value="0" selected><?php echo $text_select ?></option>';
	<?php foreach ($attribute_groups as $attribute_group) { ?>
		<?php foreach ($attributes as $attribute) { ?>
			<?php if ($attribute['attribute_group_id'] == $attribute_group['attribute_group_id']) { ?>
					html += '<option value="<?php echo $attribute['attribute_id']; ?>"><?php echo addslashes($attribute_group['name']); ?> > <?php echo addslashes($attribute['name']); ?></option>';
				<?php } ?>
			<?php } ?>
		<?php } ?>
		html += '</select>';
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_unit; ?></label>';
		html += '<div class="col-sm-10">';
	<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="moneymaker2_catalog_compare_charts[' + catalog_compare_chart_row + '][unit][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
			html += '</div>';
		<?php } ?>
		html += '</div>';
		html += '</div>';

		html += '<div class="form-group">';
		html += '<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
		html += '<div class="col-sm-10">';
		html += '<p class="paddingtop"><?php echo $entry_catalog_compare_chart_sort_help; ?></p>';
		html += '</div>';
		html += '</div>';

		html += '</div>';
		$('#vtab-catalog_compare_charts .tab-content').append(html);
		$('#catalog_compare_charts li .btn-success').parent().before('<li><a href="#tab-catalog_compare_chart' + catalog_compare_chart_row + '" data-toggle="tab" id="link-chart' + catalog_compare_chart_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-chart' + catalog_compare_chart_row + '\').parent().remove(); $(\'#tab-catalog_compare_chart' + catalog_compare_chart_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $tab_data; ?>&nbsp;#' + catalog_compare_chart_row + '</a></li>');

		$('#link-chart' + catalog_compare_chart_row).trigger('click');
		catalog_compare_chart_row++;
	}

	function testAnim(x) {
		$('#animationSandbox').removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
			$(this).removeClass();
		});
	};

	function passCheckboxes(thisObj) {
		if (thisObj.children().hasClass('active')) {
			thisObj.children().removeClass('active');
			thisObj.children().find('i').removeClass('fa-check');
			var str = thisObj.parent().parent().find('input[type=hidden]').val();
			var str2 = thisObj.children().attr("data-value");
			var updatedString = str.replace(":" + str2 + ":", "");
			thisObj.parent().parent().find('input[type=hidden]').val( updatedString );
		} else {
			thisObj.children().addClass('active');
			thisObj.children().find('i').addClass('fa-check');
			var str = thisObj.parent().parent().find('input[type=hidden]').val();
			thisObj.parent().parent().find('input[type=hidden]').val( str + ':' + thisObj.children().attr("data-value") + ':' );
		}
	};
	function selectCheckboxes(thisObj) {
		thisObj.parent().find('.btn.btn-sm i').addClass('fa-check');
		thisObj.parent().find('.btn.btn-sm').addClass('active');
		thisObj.parent().find('input[type=hidden]').val('<?php foreach ($categories as $category) { ?><?php echo ":".$category['category_id'].":"; ?><?php } ?>');
	};
	function unselectCheckboxes(thisObj) {
		thisObj.parent().find('.btn.btn-sm i').removeClass('fa-check');
		thisObj.parent().find('.btn.btn-sm').removeClass('active');
		thisObj.parent().find('input[type=hidden]').val('');
	};
	function resetCategoriesIcons() {
		var moneymaker2_common_categories_icons_values = '';
		$('#moneymaker2_categories input[type=hidden]').each(function() {
			moneymaker2_common_categories_icons_values = moneymaker2_common_categories_icons_values + ':' + $(this).val() + ':' ;
		});
		var moneymaker2_common_categories_icons_keys = '<?php foreach ($categories as $category) { ?><?php echo ":".$category['category_id'].":"; ?><?php } ?>';
		$('input[name="moneymaker2_common_categories_icons_values"]').val( moneymaker2_common_categories_icons_values );
		$('input[name="moneymaker2_common_categories_icons_keys"]').val( moneymaker2_common_categories_icons_keys );
		$('#moneymaker2_categories input[name*="moneymaker2_common_categories_icons"]' ).remove();
	};
	function resetInformationsIcons() {
		var moneymaker2_common_informations_icons_values = '';
		$('#moneymaker2_informations input[type=hidden]').each(function() {
			moneymaker2_common_informations_icons_values = moneymaker2_common_informations_icons_values + ':' + $(this).val() + ':' ;
		});
		var moneymaker2_common_informations_icons_keys = '<?php foreach ($informations as $information) { ?><?php echo ":".$information['information_id'].":"; ?><?php } ?>';
		$('input[name="moneymaker2_common_informations_icons_values"]').val( moneymaker2_common_informations_icons_values );
		$('input[name="moneymaker2_common_informations_icons_keys"]').val( moneymaker2_common_informations_icons_keys );
		$('#moneymaker2_informations input[name*="moneymaker2_common_informations_icons"]' ).remove();
	};

	$(document).ready(function(){
		$('.js--triggerAnimation').click(function(e){
			e.preventDefault();
			var anim = $('.js--animations').val();
			testAnim(anim);
		});

		$('.js--animations').change(function(){
			var anim = $(this).val();
			testAnim(anim);
		});

		$('#content > .page-header > .container-fluid > .pull-right').removeClass('hidden');

		var waitForFinalEvent = (function () {
			var timers = {};
			return function (callback, ms, uniqueId) {
				if (!uniqueId) {
					uniqueId = "uniqueId";
				}
				if (timers[uniqueId]) {
					clearTimeout (timers[uniqueId]);
				}
				timers[uniqueId] = setTimeout(callback, ms);
			};
		})();
		window.onscroll = function() {
			waitForFinalEvent(function(){
				positionApply();
			}, 50, "positionApply");

		};
		function positionApply() {
			if ($(window).scrollTop() > 75) {
				$('.container-fluid > .pull-right').addClass("sticky");
			} else {
				$('.container-fluid > .pull-right').removeClass("sticky");
			}
		}
	});
		//--></script>
</div>
<?php echo $footer; ?>