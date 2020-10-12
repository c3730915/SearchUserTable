package cn.itcast.web.servlet;

import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import cn.itcast.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取数据 用户填写的验证码
        String verifycode = request.getParameter("verifycode");
        HttpSession session = request.getSession();
        String  checkCode_session = (String) session.getAttribute("checkCode_session");
        session.removeAttribute("checkCode_session");
//        if (!checkCode_session.equalsIgnoreCase(verifycode))
//        {
//            //验证码不正确
//            request.setAttribute("login_msg","验证码错误！");
//            request.getRequestDispatcher("/list.jsp").forward(request,response);
//            return;
//
//        }
        //Todo
        //测试阶段 不使用真的验证码
        Map<String, String[]> parameterMap = request.getParameterMap(); //封装USer，map集合里有用户名以及密码
        User user = new User();
        try {
            BeanUtils.populate(user,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        UserService userService = new UserServiceImpl();
//        System.out.println(userService.findAll());

        User loginUser = userService.login(user);
        //封装User对象
        try {
            if (loginUser.getQq() != null) {
                //登陆成功
                session.setAttribute("user",loginUser);
                //调转页面
                response.sendRedirect(request.getContextPath()+"/index.jsp");

            }else {
                request.setAttribute("login_msg","用户名或密码错误");
                request.getRequestDispatcher("/login.jsp").forward(request,response);

            }
        }
        catch (NullPointerException e){
            System.out.println(e);
            request.setAttribute("login_msg","用户名或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }



       //调用Service查询

       //判断是否登陆成功

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);

    }
}
