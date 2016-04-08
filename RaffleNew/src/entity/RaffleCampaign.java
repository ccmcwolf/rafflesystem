package entity;

import java.util.HashSet;
import java.util.Set;

public class RaffleCampaign {
	private int campaign_id;
	private String campaign_name;
	private String organizer_name;
	private String contact_email;
	private int raffle_count;
	private String start_date;
	private String end_date;
	private double min_price;
	private String raffle_image_preview_path;
	private Set<Raffle> raffles = new HashSet<Raffle>(0);

	public RaffleCampaign() {
		
	}

	public int getCampaign_id() {
		return campaign_id;
	}

	public void setCampaign_id(int campaign_id) {
		this.campaign_id = campaign_id;
	}

	public String getCampaign_name() {
		return campaign_name;
	}

	public void setCampaign_name(String campaign_name) {
		this.campaign_name = campaign_name;
	}

	public String getOrganizer_name() {
		return organizer_name;
	}

	public void setOrganizer_name(String organizer_name) {
		this.organizer_name = organizer_name;
	}

	public String getContact_email() {
		return contact_email;
	}

	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}

	public int getRaffle_count() {
		return raffle_count;
	}

	public void setRaffle_count(int raffle_count) {
		this.raffle_count = raffle_count;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public double getMin_price() {
		return min_price;
	}

	public void setMin_price(double min_price) {
		this.min_price = min_price;
	}

	public String getRaffle_image_preview_path() {
		return raffle_image_preview_path;
	}

	public void setRaffle_image_preview_path(String raffle_image_preview_path) {
		this.raffle_image_preview_path = raffle_image_preview_path;
	}

	public Set<Raffle> getRaffles() {
		return raffles;
	}

	public void setRaffles(Set<Raffle> raffles) {
		this.raffles = raffles;
	}

}
