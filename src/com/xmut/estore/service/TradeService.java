package com.xmut.estore.service;

import com.xmut.estore.dao.ComputerDAO;
import com.xmut.estore.dao.TradeDAO;
import com.xmut.estore.dao.TradeItemDAO;
import com.xmut.estore.dao.impl.ComputerDAOImpl;
import com.xmut.estore.dao.impl.TradeDAOImpl;
import com.xmut.estore.dao.impl.TradeItemDAOImpl;
import com.xmut.estore.domain.Trade;
import com.xmut.estore.domain.TradeItem;

import java.util.HashSet;
import java.util.Set;

public class TradeService {
    private TradeItemDAO tradeItemDAO = new TradeItemDAOImpl();
    private TradeDAO tradeDAO = new TradeDAOImpl();
    private ComputerDAO computerDAO = new ComputerDAOImpl();

    public Set<TradeItem> getTradeItem(int userId) {
        Set<Trade> tradeSet = tradeDAO.getTradesWithUserId(userId);

        Set<TradeItem> tradeItemSet = new HashSet<>();
        for(Trade trade: tradeSet) {
            tradeItemSet.addAll(tradeItemDAO.getTradeItemsWithTradeId(trade.getTradeId()));
        }
        for(TradeItem tradeItem: tradeItemSet) {
            tradeItem.setComputer(computerDAO.getComputer(tradeItem.getComputerId()));
        }
        return tradeItemSet;
    }
}
