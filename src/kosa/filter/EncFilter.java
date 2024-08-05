package kosa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter({"/board/*","/session/*"})
public class EncFilter implements Filter {
	//board나 session으로 들어왔을때 핕터가 적용됨.

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		System.out.println("필터 적용");
		chain.doFilter(request, response);
	}

}
