package com.hzgc.service.util.auth.scan;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author liuzhikun
 * @date 2018/04/27
 */
@Data
@ToString
@EqualsAndHashCode(of = {"permission"})
public class DefaultAuthorizeDefination {
    private String name;
    private String menu;
    private String permission;
    private String description;
}
