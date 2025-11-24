import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';
import 'package:flutter_healthcare_demo/widgets/custom_button.dart';

class VideoConsultationCard extends StatelessWidget {
  final VoidCallback onVideoCall;
  final VoidCallback onAudioCall;

  const VideoConsultationCard({
    super.key,
    required this.onVideoCall,
    required this.onAudioCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.videocam_outlined,
                size: 26,
                color: Colors.black87,
              ),
              const SizedBox(width: 10),

              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Video Consultation",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "Start or join a telemedicine consultation",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          
          Center(
            child: Icon(
              Icons.videocam_outlined,
              size: 60,
              color: Colors.grey.shade400,
            ),
          ),

          const SizedBox(height: 24),

          
          const Center(
            child: Text(
              "No Active Consultation",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Start a new consultation or join an existing one",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ),

          const SizedBox(height: 36),

          
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 420;

              if (isMobile) {
                
                return Column(
                  children: [
                    CustomButton(
                      text: "Start Video Call",
                      icon: Icons.videocam,
                      onPressed: onVideoCall,
                      height: 52,
                      width: double.infinity,
                      colors: const [
                        Color(0xFF1D4ED8),
                        Color(0xFF3B82F6),
                      ],
                    ),

                    const SizedBox(height: 14),

                    CustomButton(
                      text: "Audio Only",
                      icon: Icons.call,
                      onPressed: onAudioCall,
                      height: 52,
                      width: double.infinity,
                      colors: const [
                        Colors.white,
                        Colors.white,
                      ],
                      textColor: Colors.black87,
                      outlineColor: Colors.grey,
                    ),
                  ],
                );
              }

              
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Start Video Call",
                    icon: Icons.videocam,
                    onPressed: onVideoCall,
                    height: 52,
                    width: 220,
                    colors: const [
                      Color(0xFF1D4ED8),
                      Color(0xFF3B82F6),
                    ],
                  ),

                  const SizedBox(width: 16),

                  CustomButton(
                    text: "Audio Only",
                    icon: Icons.call,
                    onPressed: onAudioCall,
                    height: 52,
                    width: 180,
                    colors: const [
                      Colors.white,
                      Colors.white,
                    ],
                    textColor: Colors.black87,
                    outlineColor: Colors.grey,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
