package Movie;

public class GenreDTO {

	private int releasedYear;
	private String actionMovie;
	private String horror;
	private String romance;
	private String animation;
	private String comedy;
	private String musical;
	private String family;
	private String drama;
	private int deleteYear;
	
	
	
	public int getReleasedYear() {
		return releasedYear;
	}
	public void setReleasedYear(int releasedYear) {
		this.releasedYear = releasedYear;
	}
	public String getActionMovie() {
		return actionMovie;
	}
	public void setActionMovie(String actionMovie) {
		this.actionMovie = actionMovie;
	}
	public String getHorror() {
		return horror;
	}
	public void setHorror(String horror) {
		this.horror = horror;
	}
	public String getRomance() {
		return romance;
	}
	public void setRomance(String romance) {
		this.romance = romance;
	}
	public String getAnimation() {
		return animation;
	}
	public void setAnimation(String animation) {
		this.animation = animation;
	}
	public String getComedy() {
		return comedy;
	}
	public void setComedy(String comedy) {
		this.comedy = comedy;
	}
	public String getMusical() {
		return musical;
	}
	public void setMusical(String musical) {
		this.musical = musical;
	}
	public int getDeleteYear() {
		return deleteYear;
	}
	public void setDeleteYear(int deleteYear) {
		this.deleteYear = deleteYear;
	}
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getDrama() {
		return drama;
	}
	public void setDrama(String drama) {
		this.drama = drama;
	}
	
}
