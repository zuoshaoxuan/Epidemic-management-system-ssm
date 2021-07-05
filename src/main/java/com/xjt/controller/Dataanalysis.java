package com.xjt.controller;


import com.xjt.model.Abnormal;
import com.xjt.service.IAbnormalService;
import com.xjt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/data")
public class Dataanalysis {
    @Autowired
    private IAbnormalService abnormalService;
    @Autowired
    private IUserService userService;
    @RequestMapping("/findab")
    public ModelAndView findab(){
        ModelAndView mv = new ModelAndView();
        List<Abnormal> abnormals=abnormalService.findab();
        long c = abnormalService.count1();
        long G=userService.count();
//        String count= String.valueOf(c);
        int Fashao = 0;int Ganmao = 0;int Kesou = 0;int Outu = 0;
        int Fuxie = 0;int Touyu = 0;int Touteng = 0;int Nosymptom = 0;
        int Noinfected=0;
        for (int i = 0; i < abnormals.size(); i++) {
            String s0=abnormals.get(i).getSymptom0();
            String s1=abnormals.get(i).getSymptom1();
            String s2=abnormals.get(i).getSymptom2();
            String s3=abnormals.get(i).getSymptom3();
            String s4=abnormals.get(i).getSymptom4();
            String s5=abnormals.get(i).getSymptom5();
            List<String> ss = new ArrayList<>();
            ss.add(s0);ss.add(s1);ss.add(s2);
            ss.add(s3);ss.add(s4);ss.add(s5);
            if(s0==null&&s1==null&&s2==null&&s3==null&&s4==null&&s5==null){
                Noinfected= Noinfected+1;
            }
            for (int j=0;j<6;j++){
               String sss= ss.get(j);
                if(sss.equals("发烧")){ Fashao=Fashao+1;
                } else if(sss.equals("感冒")){ Ganmao=Ganmao+1;
                }else if(sss.equals("咳嗽")){ Kesou=Kesou+1;
                }else if(sss.equals("呕吐")){ Outu=Outu+1;
                }else if(sss.equals("腹泻")){ Fuxie=Fuxie+1;
                }else if(sss.equals("头晕")){ Touyu=Touyu+1;
                }else if(sss.equals("头疼")){ Touteng=Touteng+1;
                }else{ Nosymptom=Nosymptom+1;
                }
            }
        }
        Nosymptom=Nosymptom+Noinfected;
        List list = new ArrayList();
        list.add(Fashao);list.add(Ganmao);list.add(Kesou);list.add(Outu);
        list.add(Fuxie);list.add(Touyu);list.add(Touteng);list.add(Nosymptom);list.add(Noinfected);
        mv.addObject("list",list);
        mv.addObject("count",c);
        mv.addObject("Gcount",G);
        mv.addObject("c",123);
        mv.setViewName("lead/sjksh");
        return mv;
    }
}
