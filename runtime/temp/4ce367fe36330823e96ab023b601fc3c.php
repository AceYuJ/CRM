<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"/var/www/html/72crm/application/admin/view/install/step3.html";i:1559789030;s:61:"/var/www/html/72crm/application/admin/view/public/header.html";i:1559789030;s:61:"/var/www/html/72crm/application/admin/view/public/footer.html";i:1559789030;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>悟空CRM安装向导</title>
        <link rel="shortcut icon" href="/72crm/public/static/icon/favicon.ico">
        <link rel="stylesheet" href="/72crm/public/static/style/base.css">
        <link rel="stylesheet" href="/72crm/public/static/style/step3.css">
        <script src="/72crm/public/static/js/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <div class="header-wrapper">
            <header class="header">
  <div class="header-content">
    <h1 class="logo">
      <a href="http://www.5kcrm.com"><img class="pic" src="/72crm/public/static/img/logo.png" alt=""></a>
    </h1>
    <div class="title">
      悟空CRM9.0安装向导
    </div>
    <div class="concat-us">
      <img class="icon" src="/72crm/public/static/icon/phone.png" alt="">
      <span class="desc">官方电话：400-0812-558</span>
    </div>
  </div>
</header>
   
        </div>
        <div class="top">
            <div class="step-group">
                <div class="step active">
                    <div class="sort">1</div>
                    <div class="desc">检查安装环境</div>
                </div>
                <div class="step active line"></div>
                <div class="step active">
                    <div class="sort">2</div>
                    <div class="desc">创建数据库</div>
                </div>
                <div class="step line active"></div>
                <div class="step">
                    <div class="sort">3</div>
                    <div class="desc">安装成功</div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="result">
                <div class="status-box">
                    <img class="pic" src="/72crm/public/static/icon/error.png" alt="">
                    <span class="status">安装失败</span>
                </div>
                <div class="desc">未按照正确的方式进行安装</div>
                <div class="control">
                    <div class="prev btn primary">返回上一步</div>
                </div>
            </div>
        </div>
        <div class="footer-wrapper">
            <footer class="footer">
  <div class="content">
    悟空CRM受国家计算机软件著作权保护，未经授权不得进行商业行为，违者必究。<br>
    &copy;2019 悟空软件<a target="_blank" href="http://www.5kcrm.com">www.5kcrm.com</a>
  </div>
</footer>

        </div>
    </body>
    <script>
        $('.prev').click(function () {
            window.location = 'step2.html'
        })
    </script>
</html>