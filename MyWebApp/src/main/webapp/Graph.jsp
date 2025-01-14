<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
        <title>Time Converter Graph</title>
            <style>html,body{
                height:100%;
            }
            //Core colours + font
            body{
                min-width:1080px;
                font-family:Helvetica;
                font-size:16px;
                color:#292929;
                margin:0;
                background:#e8e6e3
            }
            #locations h1{
                padding-top:19px;
                font-size:34px;
                color:#95b3d7;
                font-weight:bold;
                font-size:34px;
                line-height:1;
                color:#95b3d7;
                font-weight:normal;
                font-family:Tahoma;
            }
            .block1{
                width:728px;
                height:90px;
                display:inline-block;
                position:relative;
            }
            .block2{
                width:300px;
                height:250px;
                display:inline-block;
                position:relative;
            }
            .block-inner{
                position:absolute;
                border:1px dashed #c0d0fa;
                color:#888;
                font-size:16px;
                left:0;
                top:0;
                right:0;
                bottom:0;
                padding:15px;
                z-index:-1;
            }
            table{
                border-width:0;
                border-collapse:collapse;
                border-spacing:0;
            }
            //For the Bands (dst)
            .dst_note{
                text-align:left;
                font-size:80%;
                position:absolute;
                margin-top:33px;
                font-style:italic;
                left:0;
            }
            a#stAM div{
                font-size:9px;
                font-weight:normal;
                line-height:8px;
                margin-top:3px;
            }
            a#st24 div{
                font-size:120%;
                line-height:10px;
                margin-top:6px;
            }
            a#stMX div{
                font-size:11px;
                line-height:10px;
                margin-top:6px;
            }
            li.hformat a{
                border-left:1px solid #afc6dc;
                border-left:1px solid #444;
            }
            li.hformat a:first-child{
                border:0;
            }
            #glass{
                position:absolute;
                background:white;
                opacity:0;
                filter:alpha(opacity=0);
            }
            .wrapper{
                width:1013px;
                margin:0 auto;
                z-index:100;
                position:relative;
            }/*!BLOCK_START:BAND*/
            .cband,.band{
                border:2px solid #292929;
                -moz-border-radius:5px;
                -webkit-border-radius:5px;
                border-radius:5px;
                position:absolute;
                z-index:1000;
                display:none;
            }/*!BLOCK_END:BAND*/
            .band-hover{
                border-color:#black;
            }
            .band>div{
                width:50%;
                height:100%;
                background:transparent;
                opacity:.3;
                position:absolute;
                display:none;
                border-right:1px #888;
                left:0;
            }
            .cband{
                z-index:950;
                border-color:transparent;
                border-width:1px;
                display:block;
                opacity:.1;
                filter:alpha(opacity=10);
                background:transparent url("/media/img/ornaments3.png?132") repeat-x 0 -1440px;
            }
            #band-whiteout-right,#band-whiteout-left{
                background:transparent url("/media/img/ornaments3.png?132") repeat-x 0 -720px;
                position:absolute;
                opacity:.5;
                filter:alpha(opacity=50);
                z-index:930;
                display:none;
                width:auto;
            }
            .band-handle{
                position:absolute;
                z-index:20000;
                width:5px;
                margin-top:2px;
                display:none;
                cursor:w-resize;
                background:transparent;
            }
            .band-handle-shown{
                display:block;
            }
            .customizing{
                border-style:solid;
                border-color:black;
            }
            .customized{
                border-color:black;
            }
            .adjusting_left{
                border-left-color:#8c0;
                cursor:w-resize;
            }
            .adjusting_right{
                border-right-color:#8c0;
                cursor:e-resize;
            }
            .homeHour{
                position:absolute;
                left:-2px;
                right:-2px;
                border-left:3px #ddd;
                border-right:3px #ddd;
                height:30px;
            }
            .fix{
                height:1px;
                clear:both;
            }
            .hour-converter{
                display:inline-block;
                overflow:hidden;
                vertical-align:bottom;
            }
            .ie .hour-converter{
                margin-left:-3px;
            }
            .hour-converter>select{
                border:0;
                color:#888;
                margin-top:0;
                margin-left:-5px;
                margin-bottom:-1px;
                margin-right:-20px;
                font-size:12px;
                outline:0;
                font-family:Arial;
                line-height:12px;
                background:#e8e6e3;
                background:transparent;
            }
            .ie .hour-converter>select{
                margin-left:0;
            }
            #locations{
                -moz-border-radius:3px;
                -webkit-border-radius:3px;
                border-radius:3px;
                position:relative;
                padding:1px;
                background:#fff;
                -moz-box-shadow:0 20px 50px -20px rgba(0,0,0,0.3);
                -webkit-box-shadow:0 20px 50px -20px rgba(0,0,0,0.3);
                box-shadow:0 20px 50px -20px rgba(0,0,0,0.3);
                margin-top:30px;
                margin-bottom:45px;
                position:relative;
                border:1px solid #ccc;
            }
            #location{
                height:16px;
                font-size:100%;
            }
            #defaultText{
                cursor:text;
                position:absolute;
                color:#aaa;
                font-style:normal;
                margin-top:6px;
                margin-left:0;
                padding-left:23px;
                font-size:100%;
            }
            .faded{
                opacity:.5;
            }
            .data_faded{
                opacity:.3;
                filter:alpha(opacity=30);
            }
            .\_AP li u,.\_24 li i,.\_24 li em,.\_AP li em{
                font-size:70%;
                display:block;
                width:auto;
                text-align:center;
                text-decoration:none;
                font-style:normal;
                position:absolute;
                left:3px;
                right:3px;
                bottom:1px;
                height:12px;
                overflow:hidden;
                background-color:inherit;
                background-color:expression(this.parentNode.currentStyle['backgroundColor']);z-index:5;}.\_24 li em,.\_AP li em{_display:none;}.\_AP li b,.\_24 li b{position:relative;font-size:120%;line-height:26px;z-index:16;font-weight:normal;}.m00 li b{line-height:40px;font-size:125%;}.\_AP li em,.\_24 li em{z-index:3;}._AP li em:first-child,._24 li em:first-child{z-index:1;}.hourline{left:315px;top:14px;position:absolute;text-align:center;}.\_AP,.\_24{height:45px;float:left;margin:0;padding:0;list-style-type:none;list-style-image:none;}.\_AP li,.\_24 li{list-style-type:none;list-style-image:none;width:28px;height:30px;float:left;margin-top:0;margin-right:0;position:relative;z-index:900;box-shadow:none;-webkit-box-shadow:none;-moz-box-shadow:none;border-radius:0;-webkit-border-radius:0;-moz-border-radius:0;border-top:1.5px solid #000000;border-bottom:1.5px solid #000000;border-top:1.5px solid #000000;border-bottom:1.5px solid #000000;}.tod_m,.tod_e{background-color:#add8e6;color:#add8e6;color:black;border-left:none;border-right:none;}.tod_d{background-color:#Add8e6;color:black;color:#black;border-left:none;border-right:none;}.tod_n{background-color:#Add8e6;color:black;border-left:none;border-right:none;}.\_AP li.tod_c,.\_24 li.tod_c,li.top_boundary+li{background-color:#Add8e6;background-color:#Add8e6;color:black;border-radius:0px 0 0 0px;-webkit-border-radius:0px 0 0 0px;-moz-border-radius:0px 0 0 0px;border-right:none;}li.tod_boundary{border-radius:0 0px 0px 0;-webkit-border-radius:0 0px 0px 0;-moz-border-radius:0 0px 0px 0;border-left:none;width:27px;margin-right:1px;}.hourline li span{position:absolute;top:0;left:0;height:100%;width:100%;background:transparent url("/media/img/sprite.png?132") no-repeat -40px -165px;}.weekends-mode .\_AP li.w,.weekends-mode .\_24 li.w{background:#Add8e6;border-color:#Add8e6;color:#Add8e6;}.weekends-mode .\_24 li.w[class~="tod_n"],.weekends-mode .\_AP li.w[class~="tod_n"]{background:#Add8e6;border-color:#Add8e6;color:#Add8e6;}.weekends-mode .\_24 li.w[class~="tod_c"],.weekends-mode .\_AP li.w[class~="tod_c"]{background:#Add8e6;border-color:#Add8e6;color:#Add8e6;}li.tod_e div,li.tod_d div,li.tod_m div,li.tod_n div,li.tod_c div,li.tod_c b{display:block;margin-top:4px;font-size:70%;text-align:center;text-transform:uppercase;letter-spacing:0;margin-left:1px;line-height:normal;}.weekends-mode li.w[class~="tod_c"] div{color:#Add8e6;}li.tod_e div,li.tod_d div,li.tod_m div,li.tod_n div,li.tod_c div{position:absolute;top:-16px;left:0;width:24px;color:#Add8e6;}li.tod_c i{font-size:90%;font-style:normal;height:15px;}.weekends-mode .\_24 li.w[class~="dst_change"],.weekends-mode .\_AP li.w[class~="dst_change"],.\_24 li.w[class~="dst_change"],.\_AP li.w[class~="dst_change"],.\_24 li.dst_change,.\_AP li.dst_change{background:red;border-color:red;}/*!BLOCK_END:HOURLINE*/ #locations .city .inline-edit-input{border:0;padding:0;margin:0;color:#Add8e6;background:transparent;margin-left:-1px;margin-right:1px;font-family:inherit;}.cusloc #locations .city b{cursor:url("/media/img/edit-cursor.gif"),text;}#settings-dropdown{position:relative;z-index:20000;}#sd-activator{color:#Add8e6;cursor:default;padding:5px 10px;margin:-4px 0;border:1px solid;font-size:12px;border:1px solid transparent;border-radius:0px 5px 0 0;background-image:url("/media/img/sprite.png?132");background-position:-37px -167px;background-repeat:no-repeat;padding-left:35px;width:auto;}#settings-dropdown.hover>#sd-activator,#settings-dropdown:hover>#sd-activator{background-color:#Add8e6;border:1px solid #Add8e6;color:#Add8e6;background-color:#Add8e6;border:1px solid #Add8e6;background-position:-37px -129px;}#sd-dropdown{display:none;}#settings-dropdown.hover>#sd-dropdown,#settings-dropdown:hover>#sd-dropdown{border-top:3px solid #Add8e6;border-top:3px solid #Add8e6;display:block;position:absolute;margin-top:4px;border-radius:0 5px 0 0;}#sd-dropdown-shade{position:absolute;top:9px;left:0;right:0;bottom:5px;box-shadow:0 5px 24px 8px rgba(0,0,0,0.4);z-index:1;}#sd-dropdown>ul,#sd-dropdown>ul{border-top:0;list-style:none;margin:0;padding:5px;position:relative;z-index:2;background:#fff;border-radius:0 0 5px 5px;}#sd-dropdown>ul>li{padding:2px 0;white-space:nowrap;border-radius:0px;border:1px solid transparent;}#sd-dropdown>ul>li>a{padding:5px 3px;padding-left:30px;display:block;cursor:default;}#sd-dropdown>ul>li:hover{border:1px solid #ddd;background:#fafafa;}#bttn-forex-switch,#bttn-wknd-switch,#bttn-gcal-switch,#bttn-cal-settings,#bttn-tz-switch{-moz-border-radius:0px;-webkit-border-radius:0px;border-radius:0px;vertical-align:top;text-decoration:none;display:inline-block;background-image:url("/media/img/sprite.png?132");background-repeat:no-repeat;}.setting-on{font-weight:bold;}#bttn-wknd-switch{background-position:-42px -198px;padding-left:28px;width:auto;}#bttn-tz-switch{background-position:-5px -261px;padding-left:28px;width:auto;}#bttn-forex-switch{background-position:-42px -411px;padding-left:19px;width:auto;}#bttn-cal-settings,#bttn-gcal-switch{background-position:-43px -285px;padding-left:19px;width:auto;}.bttn-explicit-link{background-image:url("/media/img/sprite.png?132");background-position:-47px -502px;background-repeat:no-repeat;width:20px;display:inline-block;}#bttn-fullscreen{background-image:url("/media/img/sprite.png?132");background-position:-6px -501px;background-repeat:no-repeat;width:20px;display:inline-block;}#page-link,#page-link:visited,#meeting-link,#meeting-link:visited{color:#Add8e6;}.bttn-pressed:hover,.bttn-pressed2:hover,.bttn-normal:hover{text-decoration:none;}.bttn-normal,.bttn-pressed,.bttn-pressed2{color:#Add8e6;cursor:default;padding:5px 3px;margin:-4px 0;border:1px solid;font-size:12px;}.bttn-normal:hover{border-color:#Add8e6 #bbb #bbb #fff;}.bttn-normal{border:1px solid transparent;}.bttn-pressed{background-color:#fff;border-color:#ccc #fff #fff #ccc;}.bttn-pressed2:hover,.bttn-pressed2{border-color:#ccc #fff #fff #ccc;background-color:rgba(255,255,255,0.3);}.qm .buttons{display:none;}.buttons{position:absolute;width:30px;height:65px;top:-1px;left:-30px;}.close,.makeHome,.removeAlias{background:transparent url("/media/img/sprite.png?132") no-repeat;cursor:pointer;position:absolute;left:4px;top:15px;width:13px;height:8px;padding-bottom:3px;}.container[alias="0"] .removeAlias{display:none;}.container[alias="1"] .removeAlias{width:13px;left:4px;background-position:-10px -88px;top:39px;display:auto;}.container:hover .removeAlias,.removeAlias:hover{background-position:-23px -88px;}.removeAlias:hover{border:1px solid #666;-moz-border-radius:0px;-webkit-border-radius:0px;border-radius:0px;margin-left:-1px;margin-top:-1px;}.close{background-position:-9px -76px;}.container:hover .close,.close:hover{background-position:-22px -76px;}.makeHome:hover,.close:hover{border:1px solid #666;-moz-border-radius:0px;-webkit-border-radius:0px;border-radius:0px;margin-left:-1px;margin-top:-1px;}.makeHome{background-position:-9px -101px;top:27px;}.container:hover .makeHome,.makeHome:hover{background-position:-22px -101px;}/*!BLOCK_START:CLIENT_AREA*/ .blink .ts{color:#ccc;}.icon{margin-top:14px;position:relative;width:38px;height:30px;float:left;font-weight:700;font-size:110%;margin-right:2px;text-align:center;padding-top:1px;color:#aaa;text-shadow:1px 1px 0 #ffb;cursor:default;}.clientarea{position:relative;}.container{width:999px;height:60px;clear:both;padding-right:0;position:relative;z-index:500;}.container[lid="auto"]+.container{height:59px;border-top:1px dotted #ddd;}.location{font-size:100%;margin:0;padding-top:14px;font-weight:normal;width:160px;float:left;height:46px;}.location b{font-weight:inherit;}.data{padding-top:14px;width:90px;height:46px;text-align:left;position:absolute;left:185px;white-space:nowrap;overflow:hidden;}.data-end{position:absolute;left:90px;top:14px;}.data-end .date,.data-end .time{text-align:left;}.data-end .date{margin-left:16px;}.data-end .separ{width:16px;text-align:center;display:inline-block;}.ampm{font-size:11px;padding-left:1px;}.time{font-size:125%;font-weight:700;background-color:inherit;width:90px;text-align:right;}.date{font-size:11px;vertical-align:middle;color:#888;background-color:inherit;width:90px;text-align:right;}.country{font-size:90%;font-size:11px;vertical-align:middle;color:#888;font-weight:normal;position:relative;}.action-replace-location{color:red;}.country-overlay{display:inline-block;width:0;overflow:hidden;vertical-align:middle;}.other-conversions a{color:#888;}#locations .country{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}#locations .city{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}#locations .city .inline-edit-input,.city b{font-size:15px;font-weight:bold;width:100%;margin-bottom:0;}.dateHighlight{color:#7af;}.city small{display:inline-block;-moz-border-radius:0px;-webkit-border-radius:0px;border-radius:0px;color:#888;font-weight:normal;font-size:9px;padding:2px 2px 1px;line-height:.9;vertical-align:top;text-shadow:0 1px 0 #fff;background:#f2f2f2;border:1px solid #eaeaea;cursor:default;}#home2{background:transparent url("/media/img/sprite.png?132") no-repeat -1px -130px;}.widget #home2{background:transparent url("/media/img/home.gif?132") no-repeat 9px 0;}/*!BLOCK_END:CLIENT_AREA*/ #home{background:transparent url("/media/img/sprite.png?132") no-repeat -1px -130px;}#home span{display:none;}.ac_over .ac_lt{font-weight:bold;color:#eee;}.ac_lt{float:right;color:#888;}.ac_results{font-size:100%;font-family:Arial;border:1px solid #ccc;-moz-border-radius:0 0 3px 3px;-webkit-border-radius:0 0 3px 3px;border-radius:0 0 3px 3px;box-shadow:0 10px 20px -5px rgba(0,0,0,0.5);background-color:#fff;padding:0;margin:-2px 0 0 -1px;list-style:none;position:absolute;z-index:10000;display:none;min-width:390px;width:390px;overflow:hidden;}.ac_results li{padding:6px 8px;white-space:nowrap;color:inherit;text-align:left;overflow:hidden;min-width:250px;text-overflow:ellipsis;}.ac_over{cursor:pointer;background-color:#888;}.ac_pre{color:#888;}.ac_match{font-weight:bold;color:#444;font-size:100%;}.ac_over .ac_pre{font-weight:normal;color:#eee;}.ac_over .ac_match,.ac_over .ac_post{font-weight:bold;color:#fff;}.ac_post{font-weight:bold;font-size:100%;color:#888;}input[name="billing-period"]{display:none;}input[name="billing-period"]+label{padding:10px 14px;font-size:14px;color:#444;cursor:pointer;}.monthly-billing #billing-period1+label,.yearly-billing #billing-period2+label{color:#444;border-bottom:.3rem solid;font-weight:bold;background:#eee;border-radius:.2rem;}.monthly,.yearly{position:absolute;visibility:hidden;}.monthly-billing .monthly,.yearly-billing .yearly{position:static;visibility:visible;}.std-bttn{text-decoration:none;padding:5px 10px;background:#ddd;border-style:solid;border-width:1px;border-color:#ccc #888 #888 #ccc;border-radius:0px;font-size:12px;color:#222;text-shadow:0 1px #fff;}.bttn-primary{background:#48c;border-color:#55c #33a #33a #55c;color:#fff;text-shadow:0 1px #26a;}#social-bttns{overflow:hidden;min-width:128px;height:30px;margin-top:8px;margin-left:15px;float:left;background:url("/media/img/social-bttns.png?132") no-repeat left top;}#social-bttns.social-loaded{background:none!important;}#quick-next-day{z-index:600;position:absolute;right:0;top:0;bottom:0;width:20px;background:transparent url("/media/img/next-day.png?132") repeat-y;opacity:.3;filter:alpha(opacity=30);}#quick-next-day:hover{opacity:1;filter:alpha(opacity=100);cursor:pointer;}#loading-overlay{display:none;z-index:20000;position:absolute;right:0;top:0;left:0;bottom:0;}#loading-overlay-bg{position:absolute;top:0;left:0;right:0;bottom:0;background:#fff;opacity:.6;filter:alpha(opacity=60);}#loading-overlay-scroller{position:absolute;top:0;left:0;right:0;height:2px;-webkit-animation-name:scrollBg;-webkit-animation-duration:300ms;-webkit-animation-timing-function:linear;-webkit-animation-iteration-count:infinite;animation-name:scrollBg;animation-duration:300ms;animation-timing-function:linear;animation-iteration-count:infinite;}@-webkit-keyframes scrollBg{0%{background-position:0 -314px;visibility:visible;}100%{background-position:18px -314px;visibility:visible;}}@keyframes scrollBg{0%{background-position:0 -314px;opacity:1;}100%{background-position:18px -314px;opacity:1;}}</style>	<style>.tipsy{padding:5px;font-size:11px;line-height:1.2;position:absolute;z-index:100000;}.tipsy-inner{padding:5px 8px 4px 8px;background-color:#292929;color:#fafafa;max-width:200px;text-align:center;}.tipsy-inner{border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:0px;}.tipsy-arrow{position:absolute;background:url('/media/img/sprite.png?132') no-repeat top left;width:9px;height:5px;}.tipsy-n .tipsy-arrow{top:0;left:50%;margin-left:-4px;background-position:-13px -292px;}.tipsy-nw .tipsy-arrow{top:0;left:10px;background-position:-13px -292px;}.tipsy-ne .tipsy-arrow{top:0;right:10px;background-position:-13px -292px;}.tipsy-s .tipsy-arrow{bottom:0;left:50%;margin-left:-4px;background-position:-13px -296px;}.tipsy-sw .tipsy-arrow{bottom:0;left:10px;background-position:-13px -296px;}.tipsy-se .tipsy-arrow{bottom:0;right:10px;background-position:-13px -296px;}.tipsy-e .tipsy-arrow{top:50%;margin-top:-4px;right:0;width:5px;height:9px;background-position:top right;}.tipsy-w .tipsy-arrow{top:50%;margin-top:-4px;left:0;width:5px;height:9px;background-position:-13px -292px;}</style>	<style>.date_selector,.date_selector *{width:auto;height:auto;border:none;background:none;margin:0;padding:0;text-align:left;text-decoration:none;}.date_selector{background:#888;border:1px solid #bbb;padding:3px;margin:30px 0 0 0;position:absolute;z-index:100000;display:none;-moz-box-shadow:0 0 10px #000;-webkit-box-shadow:0 0 15px #000;}.date_selector_ieframe{position:absolute;z-index:99999;display:none;}.date_selector .nav{width:17.5em;color:#fff;}.date_selector .month_nav,.date_selector .year_nav{margin:0 0 3px 0;padding:0;display:block;position:relative;text-align:center;}.date_selector .month_nav{float:left;width:55%;}.date_selector .year_nav{float:right;width:35%;margin-right:-8px;}.date_selector .month_name,.date_selector .year_name{font-weight:bold;line-height:20px;}.date_selector .button{display:block;position:absolute;top:0;width:18px;height:18px;line-height:17px;font-weight:bold;color:#bbb;text-align:center;font-size:120%;overflow:hidden;}.date_selector .button:hover,.date_selector .button.hover{background:none;color:#003C78;cursor:pointer;border-color:#ccc;}.date_selector .prev{left:0;}.date_selector .next{right:0;}.date_selector table{border-spacing:0;border-collapse:collapse;clear:both;background:#F2F2F2;}.date_selector th,.date_selector td{border:1px solid #f2f2f2;width:2.5em;height:1.6em;padding:0;text-align:center;color:black;}.date_selector td{line-height:1.6em;text-align:center;white-space:nowrap;color:inherit;background:white;font-size:11px;}.date_selector td.today{background:#FFFEB3;}.date_selector td.unselected_month{color:#ccc;}.date_selector td.selectable_day{cursor:pointer;}.date_selector td.selected{background:#d5e5ff;color:#Add8e6;font-weight:bold;}.date_selector td.selectable_day:hover,.date_selector td.selectable_day.hover{background:#Add8e6;}
            </style>		<!--^ has all the information on the bar-->
                
                                
                <!-- Responsible for the Movable Bar-->
                <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script><script async="" type="text/javascript" src="https://www.googletagservices.com/tag/js/gpt.js"></script><script>
                    //Creates the Bar
                    window.onerror = function(msg, url, line) { var img = new Image; img.src = '/helper/jserror?m=' + encodeURIComponent(msg) + '&u=' + encodeURIComponent(url) + '&l=' + line; return false; };
                    var locations = [];
                    var ampmMode = 1;
                    var tznamesMode = 1;
                    var loggedIn = 0;
                    var selectedHourIndex = -1;
                    var overTimer = null;
                    var $containers = null;
                    var maxLocations = 10;
                    var sts = 27755340;
                    var scripts = new Array();
                    var utype = "rnl"
                    var jmpopups = {};
                    var quickmeeting = 0;
                    //Allows the bar to move
                    window.input_mapping = {"query_string": {"lid": "locations", "date": "chosen_date", "h": "home"}, "cookie": {"hka_lid": "locations", "hka_date": "chosen_date", "hka_home": "home", "hka_ap": "ampm_mode", "hka_tzn": "tznames_mode", "hka_fx": "forex_mode", "hka_ol": "olympics_mode", "hka_wknd": "weekends_mode", "hka_gc": "gcal_mode", "hka_tab": "current_tab", "hka_uurl": "undo_url", "hka_fs": "fullscreen", "hka_act": "action"}};
                    window.time_script = 1;
                    window.google_analytics_uacct = "UA-4019582-5";
                    window.pageInstance = 'b1ee3c31-5433-6064-3d25-8d44d62e5139';
                </script>
                <body class=" wap-control wab-link1">
                    <div class="wrapper">								
                        <div id="logo" style="position: relative; z-index: 50000">
                            <a style="padding-left: 0; padding-right: 0;">&nbsp;</a></ul></div>
                        <h1>Time Converter - ASD</h1>				
                        <div id="locations_wrapper">			
                            <div id="locations">			
                                <div class="toolbar" id="toolbar-default" style="position: relative;"></div>
                                <div class="toolbar" id="toolbar-meeting">
                                   <span style="float: left; padding-top: 4px; margin-left: 150px; ">
                                        <span style="display: inline-block; position: relative; text-align: center; width: 110px; padding: 0 10px;">
                                            <span style="left: 0" class="duration-arrow"></span>
                                            <span style="right: 0" class="duration-arrow"></span>
                                            <span id="meeting-duration"></span>
                                        </span>
                                    </span>
                                </div>
                                <div class="clientarea blink" style="padding: 0 0px;" data-listidx="0">
                                    <div style="z-index: 100; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px; background: transparent url('/media/img/ornaments3.png?132') repeat-x 0px -60px; opacity: 0.6"></div>
                                    <div id="quick-next-day" title="Jump to next day"></div>
                                    <div id="loading-overlay">
                                        <div id="loading-overlay-bg"></div>
                                        <div id="loading-overlay-scroller" class="inProgress"></div>
                                    </div>				
                                    <div id="controls">
                                        <div id="glass" style="z-index: 10000; inset: 0px 22px 0px 315px;"></div>
                                        <div id="band-whiteout-left"></div>
                                        <div id="band-whiteout-right"></div>
                                        <div class="cband" original-title="" style="inset: 14px 387px 14px 597px;"></div>
                                        <div class="band" original-title="" style="display: block; inset: 11px 384px 11px 594px;">
                                            <div style="display: none;"></div>
                                            <span class="homeHour" style="top: auto; bottom: 122px;"></span>
                                        </div>
                                        <div id="band-handle-left" class="band-handle"></div>
                                        <div id="band-handle-right" class="band-handle"></div>
                                    </div>
                                    <div lid="2147714" class="container srt" alias="0" data-itemidx="0">
                                        <div style="position: absolute; height: 0px">
                                            <div class="buttons">
                                                <a class="close" title="Remove from the list"></a>		</div>
                                        </div>
                                        <div class="icon" id="home" original-title="Home Time Zone (GMT+11 <b style=&quot;color:yellow&quot;>DST</b> = AEDT)"><span>+0</span>
                                        </div>
                                        <div class="location" style="cursor: move;">
                                            <div class="city"><b>Sydney</b></div>
                                            <div class="country">Australia</div>
                                        </div>
                                        <div class="data " style="cursor: move;">
                                            <div class="time"><span class="th">10</span><span class="ts">:</span><span class="tm">04</span><span class="ampm">a</span></div>
                                            <div class="data-end">
                                                <div class="time"><span class="separ">-</span><span class="th">10</span><span class="ts">:</span><span class="tm">04</span><span class="ampm">a</span></div>
                                            </div>
                                        </div>
                                        <div class="hourline">
                                            <ul class="_AP">
                                                <li class="tod_c" t="10/10/2022 00:00"><b>Oct</b><i>10</i></li><li class="tod_n" t="10/10/2022 01:00"><b>1</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_n" t="10/10/2022 02:00"><b>2</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_n" t="10/10/2022 03:00"><b>3</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_n" t="10/10/2022 04:00"><b>4</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_n" t="10/10/2022 05:00"><b>5</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_m" t="10/10/2022 06:00"><b>6</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_m" t="10/10/2022 07:00"><b>7</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 08:00"><b>8</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 09:00"><b>9</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_d tod_selected" t="10/10/2022 10:00"><b>10</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 11:00"><b>11</b> <u>am</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 12:00"><b>12</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 13:00"><b>1</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 14:00"><b>2</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 15:00"><b>3</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 16:00"><b>4</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_d" t="10/10/2022 17:00"><b>5</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_e" t="10/10/2022 18:00"><b>6</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_e" t="10/10/2022 19:00"><b>7</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_e" t="10/10/2022 20:00"><b>8</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_e" t="10/10/2022 21:00"><b>9</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_n" t="10/10/2022 22:00"><b>10</b> <u>pm</u><em> AEDT </em><em></em></li><li class="tod_n tod_boundary" t="10/10/2022 23:00"><b>11</b> <u>pm</u><em> AEDT </em><em></em></li><li style="display: none" class="tod_c" t="10/11/2022 00:00"><div>Tue</div><b>Oct</b><i>11</i></li></ul>					</div>
                                    </div>
                                    <!--Responsible to keep the bar on 30 minute intervals (whole bar)-->                                
                                    <script>
                                        locations.push({"id": "2147714", "is_home": 1, "ampm_mode": 1, "now_before_dst": 1, "dst_on_hourline": 0, "dst_same_index": 0, "dst_hour": "03", "dst_day": "2", "dst_move": -3600, "date": "10\/10\/2022"});
                                    </script>
                                    <div lid="1816670" class="container srt" alias="0" data-itemidx="1">
                                        <div style="position: absolute; height: 0px">
                                            <div class="buttons">
                                                <a class="close" title="Remove from the list"></a><a title="Mark as home" class="makeHome"></a>		</div>
                                        </div>
                                        <div class="icon" original-title="-3 hours from Home (GMT+8 = CST)"><span>-3</span>
                                        </div>
                                        <div class="location" style="cursor: move;">
                                            <div class="city"><b>Beijing</b></div>
                                            <div class="country">China</div>
                                        </div>
                                        <div class="data " style="cursor: move;">
                                            <div class="time"><span class="th">7</span><span class="ts">:</span><span class="tm">04</span><span class="ampm">a</span></div>

                                            <div class="data-end">
                                                <div class="time"><span class="separ">-</span><span class="th">7</span><span class="ts">:</span><span class="tm">04</span><span class="ampm">a</span></div>
                                            </div>
                                        </div>
                                        <div class="hourline">
                                            <ul class="_AP">
                                                <li class="tod_e w" t="10/9/2022 21:00"><b>9</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_n w" t="10/9/2022 22:00"><b>10</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_n tod_boundary w" t="10/9/2022 23:00"><b>11</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_c" t="10/10/2022 00:00"><b>Oct</b><i>10</i></li><li class="tod_n" t="10/10/2022 01:00"><b>1</b> <u>am</u><em> CST </em><em></em></li><li class="tod_n" t="10/10/2022 02:00"><b>2</b> <u>am</u><em> CST </em><em></em></li><li class="tod_n" t="10/10/2022 03:00"><b>3</b> <u>am</u><em> CST </em><em></em></li><li class="tod_n" t="10/10/2022 04:00"><b>4</b> <u>am</u><em> CST </em><em></em></li><li class="tod_n" t="10/10/2022 05:00"><b>5</b> <u>am</u><em> CST </em><em></em></li><li class="tod_m" t="10/10/2022 06:00"><b>6</b> <u>am</u><em> CST </em><em></em></li><li class="tod_m tod_selected" t="10/10/2022 07:00"><b>7</b> <u>am</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 08:00"><b>8</b> <u>am</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 09:00"><b>9</b> <u>am</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 10:00"><b>10</b> <u>am</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 11:00"><b>11</b> <u>am</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 12:00"><b>12</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 13:00"><b>1</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 14:00"><b>2</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 15:00"><b>3</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 16:00"><b>4</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_d" t="10/10/2022 17:00"><b>5</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_e" t="10/10/2022 18:00"><b>6</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_e" t="10/10/2022 19:00"><b>7</b> <u>pm</u><em> CST </em><em></em></li><li class="tod_e" t="10/10/2022 20:00"><b>8</b> <u>pm</u><em> CST </em><em></em></li><li style="display: none" class="tod_e" t="10/10/2022 21:00"><b>9</b> <u>pm</u><em> CST </em><em></em></li></ul>					</div>

                                    </div>
                                    <!--Responsible to keep the bar on 30 minute intervals (left bar)-->  
                                    <script>
                                        locations.push({"id": "1816670", "is_home": 0, "ampm_mode": 0, "now_before_dst": 1, "dst_on_hourline": 0, "dst_same_index": 0, "dst_hour": null, "dst_day": null, "dst_move": null, "date": "10\/10\/2022"});
                                    </script><div lid="3165926" class="container srt" alias="0" data-itemidx="2">
                                        <div style="position: absolute; height: 0px">
                                            <div class="buttons">
                                                <a class="close" title="Remove from the list"></a><a title="Mark as home" class="makeHome"></a>		</div>
                                        </div>
                                        <div class="icon" original-title="-9 hours from Home (GMT+2 <b style=&quot;color:yellow&quot;>DST</b> = CEST)"><span>-9</span>
                                        </div>
                                        <div class="location" style="cursor: move;">
                                            <div class="city"><b>Taranto</b></div>
                                            <div class="country">Italy</div>
                                        </div>
                                        <div class="data " style="cursor: move;">
                                            <div class="time"><span class="th">1</span><span class="ts">:</span><span class="tm">04</span><span class="ampm">a</span></div>
                                            <div class="data-end">
                                                <div class="time"><span class="separ">-</span><span class="th">1</span><span class="ts">:</span><span class="tm">04</span><span class="ampm">a</span></div>
                                            </div>
                                        </div>
                                        <div class="hourline">
                                            <ul class="_AP">
                                                <li class="tod_d w" t="10/9/2022 15:00"><b>3</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_d w" t="10/9/2022 16:00"><b>4</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_d w" t="10/9/2022 17:00"><b>5</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_e w" t="10/9/2022 18:00"><b>6</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_e w" t="10/9/2022 19:00"><b>7</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_e w" t="10/9/2022 20:00"><b>8</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_e w" t="10/9/2022 21:00"><b>9</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_n w" t="10/9/2022 22:00"><b>10</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_n tod_boundary w" t="10/9/2022 23:00"><b>11</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_c" t="10/10/2022 00:00"><b>Oct</b><i>10</i></li><li class="tod_n tod_selected" t="10/10/2022 01:00"><b>1</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_n" t="10/10/2022 02:00"><b>2</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_n" t="10/10/2022 03:00"><b>3</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_n" t="10/10/2022 04:00"><b>4</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_n" t="10/10/2022 05:00"><b>5</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_m" t="10/10/2022 06:00"><b>6</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_m" t="10/10/2022 07:00"><b>7</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 08:00"><b>8</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 09:00"><b>9</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 10:00"><b>10</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 11:00"><b>11</b> <u>am</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 12:00"><b>12</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 13:00"><b>1</b> <u>pm</u><em> CEST </em><em></em></li><li class="tod_d" t="10/10/2022 14:00"><b>2</b> <u>pm</u><em> CEST </em><em></em></li><li style="display: none" class="tod_d" t="10/10/2022 15:00"><b>3</b> <u>pm</u><em> CEST </em><em></em></li></ul>					</div>

                                    </div>
                                    <!--Responsible to keep the bar on 30 minute intervals (right bar)-->  
                                    <script>
                                        locations.push({"id": "3165926", "is_home": 0, "ampm_mode": 0, "now_before_dst": 1, "dst_on_hourline": 0, "dst_same_index": 0, "dst_hour": "03", "dst_day": "30", "dst_move": -3600, "date": "10\/10\/2022"});
                                    </script>			</div>
                                <div id="toprek" style="background: rgb(240, 240, 240); margin: 10px 0px 0px; padding: 0px; text-align: left; position: relative; height: 90px; display: none !important;">  <div class="block1" style="position: absolute; height:90px; right: 0; top: 0; width: auto ">					<!-- /212218034/prebid_banner -->
                                    </div></div>
                            </div><style>
                                #get-started li					{
                                    float: left;
                                    padding: 5px 0;
                                    line-height: 28px;
                                    width: 100%;
                                    border-bottom: 1px #adf
                                }
                                #get-started li:first-child		{
                                    border-top: 1px #adf
                                }
                                #text h1						{
                                    font-weight: normal;
                                    color: #777;
                                    margin-top: 0;
                                    margin-bottom: 11px;
                                    font-size: 18px;
                                    text-shadow: none;
                                    padding: 0
                                }
                                #locations_wrapper				{
                                    position: relative;
                                }
                                #text-wrapper					{
                                }
                                .text_top_real #locations_wrapper		{
                                    padding-top: 132px;
                                    padding-bottom: 0;
                                    position: relative;
                                }
                                .text_top_real #text-wrapper			{
                                    height: 100px;
                                    position: absolute;
                                    top: 40px;
                                }
                                .text_top_real #text p					{
                                    margin: 0;
                                    padding: 0;
                                    display: inline;
                                }
                            </style>
                            </div>	
                    </div>
                        <!--links js files to jsp-->
                        <script src="js/graphQuery.js"></script>
                        <script src="js/graphScript.js"></script>
                </body>
</html>
