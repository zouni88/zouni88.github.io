package com.xhb.logic.http.packet.bookstore;

import com.xhb.core.packet.HttpPacket;
import com.xhb.core.network.HttpRequestClient;
import com.xhb.logic.http.packet.bookstore.model.*;

public class CheckPacket extends HttpPacket<CheckResp> {
	
	public CheckPacket(CheckReq request) {
		super(request);
		this.request = request;
    }

	@Override
    public HttpRequestClient.Method requestMethod() {
        return HttpRequestClient.Method.GET;
    }

	@Override
    public String requestUri() {
        return "check" + "?book=" + request.getBook();
    }
}
