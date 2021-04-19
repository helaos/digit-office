package com.fatehole.office.service.impl;

import com.fatehole.office.mapper.MenuMapper;
import com.fatehole.office.model.Menu;
import com.fatehole.office.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/16/12:03
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> getMenusByHrId(Integer hrId) {
        return menuMapper.selectMenusByHrId(hrId);
    }

    @Override
    // @Cacheable
    public List<Menu> getAllMenusWithRole() {
        return menuMapper.selectAllMenusWithRole();
    }
}
