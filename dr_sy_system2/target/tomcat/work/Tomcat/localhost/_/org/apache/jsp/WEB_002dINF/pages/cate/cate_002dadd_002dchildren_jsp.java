/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-09-23 11:17:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.cate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cate_002dadd_002dchildren_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  \n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>欢迎页面-X-admin2.0</title>\n");
      out.write("    <meta name=\"renderer\" content=\"webkit\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi\" />\n");
      out.write("    <link rel=\"shortcut icon\" href=\"/favicon.ico\" type=\"image/x-icon\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"/static/css/font.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"/static/css/xadmin.css\">\n");
      out.write("    <script type=\"text/javascript\" src=\"https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"/static/lib/layui/layui.js\" charset=\"utf-8\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"/static/js/xadmin.js\"></script>\n");
      out.write("    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("      <script src=\"https://cdn.staticfile.org/html5shiv/r29/html5.min.js\"></script>\n");
      out.write("      <script src=\"https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("  </head>\n");
      out.write("  \n");
      out.write("  <body>\n");
      out.write("    <div class=\"x-body layui-anim layui-anim-up\">\n");
      out.write("\n");
      out.write("        <form class=\"layui-form\">\n");
      out.write("            <div class=\"layui-row layui-col-md6\">\n");
      out.write("\n");
      out.write("                <input type=\"hidden\" name=\"gtPno\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${childrenPno}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" >\n");
      out.write("                <input type=\"hidden\" name=\"gtLevel\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${childrenLevel}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\n");
      out.write("\n");
      out.write("                <div class=\"layui-form-item\">\n");
      out.write("                    <label class=\"layui-form-label\">\n");
      out.write("                        <span class=\"x-red\">*</span>商品类别名称\n");
      out.write("                    </label>\n");
      out.write("                    <div class=\"layui-input-inline\">\n");
      out.write("                        <input type=\"text\" name=\"gtName\" required=\"\" lay-verify=\"required\"\n");
      out.write("                               autocomplete=\"off\" class=\"layui-input\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"layui-form-mid layui-word-aux\">\n");
      out.write("                        <span class=\"x-red\">*</span>商品类别名称\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"layui-form-item\">\n");
      out.write("                    <label class=\"layui-form-label\">\n");
      out.write("                        <span class=\"x-red\">*</span>商品类别描述\n");
      out.write("                    </label>\n");
      out.write("                    <div class=\"layui-input-inline\">\n");
      out.write("                        <input type=\"text\" name=\"gtDescript\" required=\"\" lay-verify=\"required\"\n");
      out.write("                               autocomplete=\"off\" class=\"layui-input\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"layui-form-mid layui-word-aux\">\n");
      out.write("                        <span class=\"x-red\">*</span>分类描述\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"layui-form-item\">\n");
      out.write("                    <label class=\"layui-form-label\">\n");
      out.write("                        <span class=\"x-red\">*</span>商品类别备注\n");
      out.write("                    </label>\n");
      out.write("                    <div class=\"layui-input-inline\">\n");
      out.write("                        <input type=\"text\" name=\"gtRemark\" required=\"\"\n");
      out.write("                               autocomplete=\"off\" class=\"layui-input\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"layui-form-mid layui-word-aux\">\n");
      out.write("                        <span class=\"x-red\">*</span>商品类别备注\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"layui-form-item\">\n");
      out.write("                    <label  class=\"layui-form-label\">\n");
      out.write("                    </label>\n");
      out.write("                    <button  class=\"layui-btn\" lay-filter=\"add\" lay-submit=\"\">\n");
      out.write("                        增加\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("      </form>\n");
      out.write("    </div>\n");
      out.write("    <script>\n");
      out.write("\n");
      out.write("        layui.use(['form','layer'], function(){\n");
      out.write("            //$ = layui.jquery;\n");
      out.write("          var form = layui.form\n");
      out.write("          ,layer = layui.layer;\n");
      out.write("\n");
      out.write("          //监听提交\n");
      out.write("          form.on('submit(add)', function(data){\n");
      out.write("             console.log(data);\n");
      out.write("            //发异步，把数据提交给java\n");
      out.write("            $.ajax({\n");
      out.write("                type:\"post\",\n");
      out.write("                url:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/cate/insertChildren\",\n");
      out.write("                data: data.field,\n");
      out.write("                dataType:\"json\",\n");
      out.write("                success:function (data) {\n");
      out.write("\n");
      out.write("                    console.log(data);\n");
      out.write("\n");
      out.write("                    layer.alert(data.msg, {icon: 6},function () {\n");
      out.write("                        if(data.code == 200){\n");
      out.write("                            // 获得frame索引\n");
      out.write("                           /* var index = parent.layer.getFrameIndex(window.name);\n");
      out.write("                            //关闭当前frame\n");
      out.write("                            parent.layer.close();*/\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            return false;\n");
      out.write("          });\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
