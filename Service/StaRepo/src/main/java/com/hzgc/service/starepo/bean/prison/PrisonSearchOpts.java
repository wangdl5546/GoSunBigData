package com.hzgc.service.starepo.bean.prison;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Data
public class PrisonSearchOpts implements Serializable{

    /**
     * 求各个对象类型下，人员所在位置的人数情况下的时候，需要传过来的参数;
     * 举例：List<pkeys>
     */
    private List<String> pkeysCount;

    /**
     * 需要重置人员位置的对象库，即传过来一批对象类型List;
     * 举例：List<pkeys>
     */
    private List<String> pkeysReset;

    /**
     * 需要更新的人员的数据，多批人员;
     * 举例：Map<location,List<id>>
     */
    private Map<String, List<String>> pkeysUpate;
}
