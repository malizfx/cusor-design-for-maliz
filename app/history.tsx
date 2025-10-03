import { View, Text, StyleSheet } from 'react-native';

export default function HistoryScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>History</Text>
      <Text style={styles.subtitle}>Your past sessions will appear here.</Text>
      <View style={styles.card}>
        <Text style={styles.cardTitle}>Upper A • Mon</Text>
        <Text style={styles.cardText}>Bench 3x5@80kg, Row 3x8@60kg</Text>
      </View>
      <View style={styles.card}>
        <Text style={styles.cardTitle}>Lower A • Thu</Text>
        <Text style={styles.cardText}>Squat 3x5@100kg, RDL 3x8@80kg</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#0B0F13', padding: 20, paddingTop: 64 },
  title: { color: '#FFFFFF', fontSize: 24, fontWeight: '700', marginBottom: 8 },
  subtitle: { color: '#9CA3AF', marginBottom: 12 },
  card: { backgroundColor: '#111827', borderColor: '#1F2937', borderWidth: 1, borderRadius: 12, padding: 14, marginBottom: 10 },
  cardTitle: { color: '#FFFFFF', fontWeight: '700', marginBottom: 4 },
  cardText: { color: '#9CA3AF' },
});

