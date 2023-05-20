package com.shop.service.serviceImpl;

import com.shop.DAO.VipDAO;
import com.shop.config.BusinessException;
import com.shop.config.ShopEnum;
import com.shop.model.Vip;
import com.shop.service.VipService;
import com.shop.utils.Md5Utils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@Slf4j
public class VipImpl implements VipService {
    private final VipDAO dao;

    public List<Vip> findAll() {
        return dao.findAll();
    }

    public VipImpl(VipDAO dao) {
        this.dao = dao;
    }

    @Override
    public Vip findVipById(String id) {
        return dao.findVipById(id);
    }

    public boolean loginPass(String id, String password) {
        Vip vip1 = dao.findVipById(id);
        String cv = password + id;
        boolean pass = Md5Utils.encrypt(cv).equals(vip1.getPassword());

        return pass;

    }

    public boolean addVip(String id, String password) {
        dao.addVip(id, Md5Utils.encrypt((password + id)));
        return true;
    }

    /**
     * 更改头像
     *
     * @param file
     */
    @Override
    public void updataPhoto(MultipartFile file, String vipId, HttpSession session) {
        if (file.isEmpty()) {
            throw new BusinessException("文件为空");
        }
        String originalFileName = file.getOriginalFilename();
        String ext = "." + originalFileName.split("\\.")[1];
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String fileName = uuid + ext;
        ApplicationHome applicationHome = new ApplicationHome(this.getClass());
        String pre = applicationHome.getDir().getParentFile().getParentFile().getAbsolutePath() + "\\photo\\";
        String path = pre + fileName;
        try {
            file.transferTo(new File(path));
            log.info("上传成功");
        } catch (IOException e) {
            throw new BusinessException("上传失败");
        }
        Vip vip = new Vip();
        vip.setPhoto(fileName);
        vip.setId(vipId);
        dao.updataPhoto(vip);
        Vip newVip = dao.findVipById((String) session.getAttribute(ShopEnum.VIP_ID));
        session.setAttribute(ShopEnum.VIP, newVip);

    }

    @Override
    public void updataVip(Vip vip,HttpSession session) {
        dao.updataVip(vip);
        Vip newVip = dao.findVipById((String) session.getAttribute(ShopEnum.VIP_ID));
        session.setAttribute(ShopEnum.VIP,newVip);
    }
}
