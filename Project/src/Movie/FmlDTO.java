package Movie;

public class FmlDTO {
	
	private int locationID;
	private String locationName;
	private String address;
	private String country;
	private String movieName;
	private String deleteMovie;
	private String deleteLocation;
	
	public String getDeleteMovie() {
		return deleteMovie;
	}
	public void setDeleteMovie(String deleteMovie) {
		this.deleteMovie = deleteMovie;
	}
	public String getDeleteLocation() {
		return deleteLocation;
	}
	public void setDeleteLocation(String deleteLocation) {
		this.deleteLocation = deleteLocation;
	}
	public int getLocationID() {
		return locationID;
	}
	public void setLocationID(int locationID) {
		this.locationID = locationID;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	
	
}
