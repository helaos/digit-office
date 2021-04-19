package com.fatehole.office.service;

import com.fatehole.office.model.Menu;

import java.util.List;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/16/11:58
 */
public interface MenuService {

    /**
     * 根据用户ID获取可访问的菜单
     * @param hrId 登录对象的ID
     * @return 菜单集合
     */
    List<Menu> getMenusByHrId(Integer hrId);

    /**
     * 获取所有的角色
     * @return ？
     */
    List<Menu> getAllMenusWithRole();
}
