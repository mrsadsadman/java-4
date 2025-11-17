package poly.edu.dto;

import java.util.Date;

/**
 * Lớp này dùng để chứa dữ liệu tổng hợp từ JPQL. Quan trọng: Phải có
 * constructor khớp với các trường SELECT.
 */

public class ShareReport {
	private String videoTitle;
	private Long shareCount;
	private Date firstDate;
	private Date lastDate;

	// Constructor rỗng
	public ShareReport() {
	}

	// Constructor dùng cho JPQL (SELECT NEW ...)
	public ShareReport(String videoTitle, Long shareCount, Date firstDate, Date lastDate) {
		this.videoTitle = videoTitle;
		this.shareCount = shareCount;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
	}

	// Getters and Setters
	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public Long getShareCount() {
		return shareCount;
	}

	public void setShareCount(Long shareCount) {
		this.shareCount = shareCount;
	}

	public Date getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(Date firstDate) {
		this.firstDate = firstDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
}