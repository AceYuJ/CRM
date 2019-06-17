<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"/var/www/html/72crm/application/admin/view/install/step1.html";i:1559789030;s:61:"/var/www/html/72crm/application/admin/view/public/header.html";i:1559789030;s:61:"/var/www/html/72crm/application/admin/view/public/footer.html";i:1559789030;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>悟空CRM安装向导</title>
        <link rel="shortcut icon" href="/72crm/public/static/icon/favicon.ico">
        <link rel="stylesheet" href="/72crm/public/static/style/base.css">
        <link rel="stylesheet" href="/72crm/public/static/style/step1.css">
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
                <div class="step line"></div>
                <div class="step">
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
                    <span class="title">1 检查安装环境</span>
                    <span class="version">当前版本：<?php echo $data['version']['VERSION']; ?> <?php echo $data['version']['RELEASE']; ?></span>
                </div>
                <div class="table">
                    <table class="table_01">
                        <thead>
                            <tr>
                                <th>检查项</th>
                                <th>当前环境</th>
                                <th>悟空CRM建议</th>
                                <th>功能影响</th>
                            </tr>
                        </thead>
                        <tbody>
                            <volist name="<?php echo $data['env']; ?>" id="row">
                                <tr>
                                    <td><?php echo $data['env']['os'][0]; ?></td>
                                    <td><?php echo $data['env']['os'][3]; ?></td>
                                    <td><?php echo $data['env']['os'][2]; ?></td>
                                    <td>功能影响 </td>
                                </tr>
                                <tr>
                                    <td><?php echo $data['env']['php'][0]; ?></td>
                                    <td><?php echo $data['env']['php'][3]; ?></td>
                                    <td><?php echo $data['env']['php'][2]; ?></td>
                                    <td>功能影响 </td>
                                </tr>
                            </volist>
                        </tbody>
                    </table>
                    <table class="catalogue-table">
                    <thead>
                    <tr>
                    <th>目录文件</th>
                    <th>所需状态</th>
                    <th>当前状态<?php echo $data['dir'][0][1]; ?></th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php foreach($data['dir'] as $value){ ?>
                        <tr>
                            <td><?php echo $value[1]; ?></td>
                            <td><?php echo $value[3]; ?></td>
                        <?php if($value[5] =='ok') { ?>
                            <td><img src="/72crm/public/static/icon/success.png" width="20"></td>
                        <?php } else { ?>
                            <td><img src="/72crm/public/static/icon/error.png" width="20"></td>
                        <?php } ?>
                        </tr>
                        <?php } ?>
                    </tbody>
                    </table>
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
    <script src="/72crm/public/static/js/step1.js"></script>
</html>