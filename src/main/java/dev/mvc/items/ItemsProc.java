package dev.mvc.items;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.items.ItemsProc")
public class ItemsProc implements ItemsProcInter {
    @Autowired
    private ItemsDAOInter itemsDAO;

    @Override
    public int create(ItemsVO itemsVO) {
        int cnt = this.itemsDAO.create(itemsVO);
        return cnt;
    }


}


