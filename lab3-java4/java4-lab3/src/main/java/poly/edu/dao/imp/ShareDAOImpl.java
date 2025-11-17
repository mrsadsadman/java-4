package poly.edu.dao.imp;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import poly.edu.dao.ShareDAO;
import poly.edu.dto.ShareReport;
import poly.edu.model.Share;
import poly.edu.utill.JpaUtil;

public class ShareDAOImpl implements ShareDAO {

	@Override
	public Share findById(Long id) {
		EntityManager em = JpaUtil.getEntityManager();
		return em.find(Share.class, id);
	}

	@Override
	public List<Share> findAll() {
		EntityManager em = JpaUtil.getEntityManager();
		TypedQuery<Share> query = em.createQuery("SELECT s FROM Share s", Share.class);
		return query.getResultList();
	}

	@Override
	public Share create(Share entity) {
		EntityManager em = JpaUtil.getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException("Lỗi khi thêm mới Share", e);
		} finally {
			em.close();
		}
	}

	@Override
	public void update(Share entity) {
		EntityManager em = JpaUtil.getEntityManager();
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException("Lỗi khi cập nhật Share", e);
		} finally {
			em.close();
		}
	}

	@Override
	public Share deleteById(Long id) {
		EntityManager em = JpaUtil.getEntityManager();
		try {
			em.getTransaction().begin();
			Share entity = em.find(Share.class, id);
			if (entity != null) {
				em.remove(entity);
			}
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException("Lỗi khi xóa Share", e);
		} finally {
			em.close();
		}
	}

	@Override
	public List<ShareReport> getShareReport() {
		EntityManager em = JpaUtil.getEntityManager();

		// Dùng SELECT NEW để gọi constructor của DTO
		String jpql = "SELECT NEW poly.edu.dto.ShareReport(" + " s.video.title, " + " COUNT(s.id), "
				+ " MIN(s.shareDate), " + " MAX(s.shareDate) " + ") " + "FROM Share s GROUP BY s.video.title"; // Nhóm
																												// theo
																												// title

		TypedQuery<ShareReport> query = em.createQuery(jpql, ShareReport.class);
		return query.getResultList();
	}
}