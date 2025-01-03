package com.xhb.logic.http.packet.bookstore;

import com.xhb.core.packet.HttpPacket;
import com.xhb.core.network.HttpRequestClient;
import com.xhb.logic.http.packet.bookstore.model.*;

public class AddPacket extends HttpPacket<AddResp> {
	
	public AddPacket(AddReq request) {
		super(request);
		this.request = request;
    }

	@Override
    public HttpRequestClient.Method requestMethod() {
        return HttpRequestClient.Method.GET;
    }

	@Override
    public String requestUri() {
        return "add" + "?book=" + request.getBook() + "&price=" + request.getPrice();
    }
}
