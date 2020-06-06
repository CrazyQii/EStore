package com.xmut.estore.dao.impl;

import java.util.LinkedHashSet;
import java.util.Set;

import com.xmut.estore.dao.TradeDAO;
import com.xmut.estore.db.JDBCUtils;
import com.xmut.estore.domain.Trade;

public class TradeDAOImpl extends BaseDAO<Trade> implements TradeDAO {

	@Override
	public void insert(Trade trade) {
		String sql = "INSERT INTO trade (userid) VALUES " +
				"(?)";
		long tradeId = insert(sql, trade.getUserId());
		trade.setTradeId((int)tradeId);
	}

	@Override
	public Set<Trade> getTradesWithUserId(Integer userId) {
		String sql = "SELECT tradeId, userId FROM trade " +
				"WHERE userId = ? ORDER BY tradeid DESC";
		return new LinkedHashSet(queryForList(sql, userId));
	}

}
