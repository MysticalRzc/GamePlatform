package charge.dao;

import java.util.Random;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import user.dao.BaseHibernateDAO;
import charge.mode.TCharge;

public class TChargeDAO extends BaseHibernateDAO {
//	Configuration config =  new AnnotationConfiguration().configure();;
//	SessionFactory factory = config.buildSessionFactory();
	Session session = null;

	public void save(TCharge tCharge) {
		this.open();
		session.save(tCharge);
		this.close();
	}

/*	@Test
	public void test() {
		TCharge tCharge = new TCharge();
		tCharge.setChargeMoneyNow(999.0);
		tCharge.setChargeMoneyTotal(546.0);
		tCharge.setChargeUserId(31);
		update(tCharge);
	}*/

	public void update(TCharge tCharge) {
		System.out.println(tCharge.getChargeMoneyNow());
		System.out.println(tCharge.getChargeMoneyTotal());
		System.out.println(tCharge.getChargeUserId());
		this.open();
		session.delete(tCharge);
		session.save(tCharge);
		this.close();
	}

	public TCharge findById(int tChargeId) {
		this.open();
		TCharge charge = new TCharge();
		charge = (TCharge) getSession().get("charge.mode.TCharge", tChargeId);
		this.close();
		return charge;
	}

	private void open() {
		session = getSession();
	}

	public void close() {
		session.beginTransaction().commit();
		session.flush();
		session.close();
	}
}