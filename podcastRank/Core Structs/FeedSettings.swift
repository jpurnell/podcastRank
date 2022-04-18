//
//  FeedSettings.swift
//  PodcastRanker
//
//  Created by Justin Purnell on 9/19/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation
struct FeedSettings {
//	static let apiBase = "https://rss.itunes.apple.com/api/v1/"
    static let apiBase = "https://rss.applemarketingtools.com/api/v2"
	static let countryUS = "us"
	
	enum MediaType: String {
		case appleMusic = "apple-music"
		case iTunesMusic = "itunes-music"
		case iOSApps = "ios-apps"
		case macApps = "macos-apps"
		case audiobooks = "audiobooks"
		case books = "books"
		case podcasts = "podcasts"
		case musicVideos = "music-videos"
		case tvShows = "tv-shows"
	}
	
	enum Explicit: String {
		case explicit = "explicit"
		case nonExplicit = "non-explicit"
	}
	
	enum Format: String {
		case json = ".json"
		case xmlRSS = ".rss"
		case xmlAtom = ".atom"
	}
	struct FeedType {
		
		struct AppleMusic {
			static let hotTracks = "hot-tracks"
			static let hotTracksCountry = "hot-tracks-country"
			static let hotTracksMetal = "hot-tracks-heavy-metal"
			static let hotTracksNewMusic = "new-music"
			static let recentReleasesCountry = "recent-releases-country"
			static let recentReleasesMetal = "recent-releases-heavy-metal"
			static let topAlbums = "top-albums"
			static let topSongs = "top-songs"
		}
		
		struct ITunesMusic {
			static let bluegrass = "bluegrass"
			static let hotAlbums = "hot-albums"
			static let hotTracks = "hot-tracks"
			static let hotTracksMetal = "hot-tracks-heavy-metal"
			static let newMusic = "new-music"
			static let newMusicCountry = "new-music-country"
			static let newMusicMetal = "new-music-heavy-metal"
			static let recentReleases = "recent-releases"
			static let recentReleasesMetal = "recent-releases-heavy-metal"
			static let topAlbums = "top-albums"
			static let topSongs = "top-songs"
			static let topSongsCountry = "top-songs-country"
		}
		
		struct IOSApps {
			static let newAppsWeLove = "new-apps-we-love"
			static let newGamesWeLove = "new-games-we-love"
			static let topFree = "top-free"
			static let topFreeGames = "top-free-games"
			static let topFreeiPad = "top-free-ipad"
			static let topGrossing = "top-grossing"
			static let topGrossingiPad = "top-grossing-ipad"
			static let topPaid = "top-paid"
			static let topPaidGames = "top-paid-games"
		}
		
		struct MacApps {
			static let topFreeMacApps = "top-free-mac-apps"
			static let topGrossingMacApps = "top-grossing-mac-apps"
			static let topMacApps = "top-mac-apps"
			static let topPaidMacApps = "top-paid-mac-apps"
		}
		
		struct Audiobooks {
			static let topAudiobooks = "top-audiobooks"
		}
		
		struct Books {
			static let topFree = "top-free"
			static let topPaid = "top-paid"
		}
		
		struct TvShows {
			static let topTVSeasons = "top-tv-seasons"
			static let topTVEpisodes = "top-tv-episodes"
		}
		
		struct Movies {
			static let topMovies = "top-movies"
			static let topMoviesActionAdventure = "top-movies-action-and-adventure"
			static let topMoviesDocumentary = "top-movies-documentary"
		}
		
		struct Podcasts {
			static let topPodcasts = "top-podcasts/all"
            static let topPodcastsV2 = "top"
		}
		
		struct MusicVideos {
			static let topMusicVideos = "top-music-videos"
		}
	}
}
