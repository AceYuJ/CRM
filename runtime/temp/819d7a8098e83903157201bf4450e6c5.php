<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"/var/www/html/72crm/application/admin/view/install/step2.html";i:1559789030;s:61:"/var/www/html/72crm/application/admin/view/public/header.html";i:1559789030;s:61:"/var/www/html/72crm/application/admin/view/public/footer.html";i:1559789030;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>悟空CRM安装向导</title>
        <link rel="shortcut icon" href="/72crm/public/static/icon/favicon.ico">
        <link rel="stylesheet" href="/72crm/public/static/style/base.css">
        <link rel="stylesheet" href="/72crm/public/static/style/step2.css">
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
                <div class="step line"></div>
                <div class="step">
                    <div class="sort">3</div>
                    <div class="desc">安装成功</div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="content">
                <div class="base-top">
                    <span class="title">2 创建数据库</span>
                    <span class="version">当前版本：<?php echo $envir_data['version']['VERSION']; ?> <?php echo $envir_data['version']['RELEASE']; ?></span>
                </div>
                <div class="form">
                    <div class="form-sec-title">请填写数据库信息</div>
                        <div class="form-item">
                            <div class="form-label">数据库主机：</div>
                            <input type="text" name="databaseUrl">
                            <!--<div class="error" style="display: none">数据库主机不能空</div>-->
                            <div class="remind">数据库地址一般为localhost</div>
                        </div>
                        <div class="form-item">
                            <div class="form-label">数据库名：</div>
                            <input type="text" name="databaseName">
                        </div>
                        <div class="form-item">
                            <div class="form-label">端口：</div>
                            <input type="text" name="databasePort">
                            <div class="remind">一般为 3306</div>
                        </div>
                        <div class="form-item">
                            <div class="form-label">数据库用户名：</div>
                            <input type="text" name="databaseUser">
                        </div>
                        <div class="form-item">
                            <div class="form-label">数据库密码：</div>
                            <input type="password" name="databasePwd">
                        </div>
                        <div class="form-item">
                        <div class="form-label">表前缀：</div>
                            <input type="text" name="databaseTable">
                            <div class="remind">默认为5kcrm_</div>
                        </div>
                        <div class="form-sec-title">请填写管理员信息</div>
                        <div class="form-item">
                            <div class="form-label">管理员账号：</div>
                            <input type="text" name="root" placeholder="请输入手机号码">
                        </div>
                        <div class="form-item">
                        <div class="form-label">管理员密码：</div>
                        <input type="password" name="pwd">
                    </div>
                </div>
                <div class="install_progress_a">
                <!-- <progress class="install_progress" max="97" value="8"></progress> -->
                </div>
                <div class="control">
                    <div class="prev btn">上一步</div>
                    <div class="next btn primary">下一步</div>
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
<!-- <script src="/72crm/public/static/js/base.js"></script> -->
<script src="/72crm/public/static/js/step2.js"></script> 
</html>