package com.xjt.service.impl;


import com.xjt.dao.IReportDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("reportService")
public class IReportServiceImpl {
    @Resource
    private IReportDao reportDao;
}
