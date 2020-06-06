package com.xmut.estore.domain;

public class Trade {

	//Trade 对象对应的 id
	private Integer tradeId;

	//和 Trade 关联的 User 的 userId
	private Integer userId;
	
	public Integer getTradeId() {
		return tradeId;
	}

	public void setTradeId(Integer tradeId) {
		this.tradeId = tradeId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}

